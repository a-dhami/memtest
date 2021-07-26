//
//  ViewController.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-20.
//

#import "ViewController.h"
#import "drivedetect.h"


@implementation ViewController;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSMutableArray *drives = drivedetect();
    for (NSURL *url in drives){
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
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)refresh:(id)sender {
    
    //remove existing drives from array
    [_list removeAllItems];
    NSLog(@"all dropdown items removed");
    
    NSMutableArray *drives = drivedetect();
    for (NSURL *url in drives){
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
    
}

- (IBAction)updateDropDown:(id)sender {
}

- (IBAction)testButton:(id)sender {
}

@end
