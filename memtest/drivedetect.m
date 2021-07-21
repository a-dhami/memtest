//
//  drivedetect.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-20.
//

#import <Foundation/Foundation.h>

NSMutableArray* drivedetect(void){
    
    //1.External Drive Detection

    //Determining the names of external volumes present
    NSFileManager *fileManager = [NSFileManager alloc];
    NSArray *keys = [NSArray arrayWithObjects:NSURLVolumeNameKey,NSURLVolumeIsEjectableKey, NSURLVolumeIsRemovableKey,NSURLVolumeIsLocalKey, NSURLVolumeIsInternalKey,
 nil];
    NSVolumeEnumerationOptions options = NSVolumeEnumerationSkipHiddenVolumes;
    NSArray *urls = [fileManager mountedVolumeURLsIncludingResourceValuesForKeys: keys
                                   options: options];

    //create MutableArray that can be edited
    NSMutableArray *volumesToList = [[NSMutableArray alloc]init];

    for (NSURL *url in urls) {
        NSError *error;
        NSString *volumeName;
        NSNumber *isInternal;
        NSNumber *isEjectable;
        NSNumber *isLocal;
        [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
        [url getResourceValue:&isInternal forKey:NSURLVolumeIsInternalKey error:&error];
        [url getResourceValue:&isEjectable forKey:NSURLVolumeIsEjectableKey error:&error];
        [url getResourceValue:&isLocal forKey:NSURLVolumeIsLocalKey error:&error];
        
        // determining if the volume is internal or external (looking for USBs/SDs only)
        // filtering out Network Attached Storage, Unmounted Disks, and Internal HDD/SDD
        
        if([isInternal intValue] == 0 && isInternal){
            [volumesToList addObject:url];
            NSLog(@"Volume (added): %@", volumeName);
            NSLog(@"is Internal: %@", isInternal);
            NSLog(@"is Ejectable: %@", isEjectable);
            NSLog(@"is Local: %@", isLocal);
        }
        else{
            NSLog(@"Volume (internal): %@ skipped", volumeName);
            NSLog(@"is Internal: %@", isInternal);
            NSLog(@"is Ejectable: %@", isEjectable);
            NSLog(@"is Local: %@", isLocal);

        }
    }
    
    return volumesToList;

}
