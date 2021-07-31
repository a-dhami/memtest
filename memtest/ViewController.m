//
//  ViewController.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-20.
//

#import "ViewController.h"
#import "instance.h"
#import "drivedetect.h"


@implementation ViewController;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    Instance *sharedInstance = [Instance sharedInstance];
    for (NSURL *url in sharedInstance.volumes){
        NSString *volumeName;
        NSError *error;
        [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
        [_list addItemWithTitle:(NSString *)volumeName];
        NSLog(@"adding to dropdown: %@ ",volumeName);
    }
    NSInteger numOfDrives = [_list numberOfItems];
    if(numOfDrives == 0){
        [_list addItemWithTitle:@"No Removable Disks Detected"];
    }
    else{
        sharedInstance.selectedVolume = 0;
        
        //update labels to show disk name, size, free space
        NSURL *url = [sharedInstance.volumes firstObject];
        NSError *error;
        NSString *volumeName;
        NSNumber *totalSize;
        NSNumber *freeSpace;
        [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
        [url getResourceValue:&totalSize forKey:NSURLVolumeTotalCapacityKey error:&error];
        [url getResourceValue:&freeSpace forKey:NSURLVolumeAvailableCapacityKey error:&error];
        
        long long lltotalSize = [totalSize longLongValue];
        long long llfreeSpace = [freeSpace longLongValue];
        
        NSString *displayTotalSize = [NSByteCountFormatter stringFromByteCount:lltotalSize countStyle:NSByteCountFormatterCountStyleFile];
        NSString *displayFreeSpace = [NSByteCountFormatter stringFromByteCount:llfreeSpace countStyle:NSByteCountFormatterCountStyleFile];
        
        [_txtDiskName setStringValue:volumeName];
        [_txtTotalSize setStringValue:displayTotalSize];
        [_txtFreeSpace setStringValue:displayFreeSpace];
    }
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)refresh:(id)sender {
    
    //remove existing drives from popupbutton
    [_list removeAllItems];
    NSLog(@"all dropdown items removed");
    
    //refresh drives by resetting array
    Instance *sharedInstance = [Instance sharedInstance];
    refreshDrive();
    
    for (NSURL *url in sharedInstance.volumes){
        NSString *volumeName;
        NSError *error;
        [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
        [_list addItemWithTitle:(NSString *)volumeName];
        NSLog(@"adding to dropdown: %@ ",volumeName);
        
    }
    
    NSInteger numOfDrives = [_list numberOfItems];
    if(numOfDrives == 0){
        [_list addItemWithTitle:@"No Removable Disks Detected"];
    }
    else{
        NSLog(@"volumes found: setting selectedVolume to 1");
        sharedInstance.selectedVolume = 0;
        
        //update labels to show disk name, size, free space
        NSURL *url = [sharedInstance.volumes firstObject];
        NSError *error;
        NSString *volumeName;
        NSNumber *totalSize;
        NSNumber *freeSpace;
        [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
        [url getResourceValue:&totalSize forKey:NSURLVolumeTotalCapacityKey error:&error];
        [url getResourceValue:&freeSpace forKey:NSURLVolumeAvailableCapacityKey error:&error];
        
        long long lltotalSize = [totalSize longLongValue];
        long long llfreeSpace = [freeSpace longLongValue];
        
        NSString *displayTotalSize = [NSByteCountFormatter stringFromByteCount:lltotalSize countStyle:NSByteCountFormatterCountStyleFile];
        NSString *displayFreeSpace = [NSByteCountFormatter stringFromByteCount:llfreeSpace countStyle:NSByteCountFormatterCountStyleFile];
        
        [_txtDiskName setStringValue:volumeName];
        [_txtTotalSize setStringValue:displayTotalSize];
        [_txtFreeSpace setStringValue:displayFreeSpace];
    }
    
}

- (IBAction)updateDropDown:(id)sender {
    Instance *sharedInstance = [Instance sharedInstance];
    sharedInstance.selectedVolume = (int)[_list indexOfSelectedItem];
    NSLog(@"Item Index Selected %i", sharedInstance.selectedVolume);
    
    //update labels to show disk name, size, free space
    NSURL *url = [sharedInstance.volumes objectAtIndex:sharedInstance.selectedVolume];
    NSError *error;
    NSString *volumeName;
    NSNumber *totalSize;
    NSNumber *freeSpace;
    [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
    [url getResourceValue:&totalSize forKey:NSURLVolumeTotalCapacityKey error:&error];
    [url getResourceValue:&freeSpace forKey:NSURLVolumeAvailableCapacityKey error:&error];
    
    long long lltotalSize = [totalSize longLongValue];
    long long llfreeSpace = [freeSpace longLongValue];
    
    NSString *displayTotalSize = [NSByteCountFormatter stringFromByteCount:lltotalSize countStyle:NSByteCountFormatterCountStyleFile];
    NSString *displayFreeSpace = [NSByteCountFormatter stringFromByteCount:llfreeSpace countStyle:NSByteCountFormatterCountStyleFile];
    
    [_txtDiskName setStringValue:volumeName];
    [_txtTotalSize setStringValue:displayTotalSize];
    [_txtFreeSpace setStringValue:displayFreeSpace];
    
}

- (IBAction)testButton:(id)sender {
}

@end
