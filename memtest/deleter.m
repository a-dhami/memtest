//
//  deleter.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-08-25.
//

#import <Foundation/Foundation.h>
#import "instance.h"
#import "deleter.h"

void deleter(void){
    //hooking into the sharedinstance to obtain array of drives
    Instance *sharedInstance = [Instance sharedInstance];
    
    //obtaining the URL to the drive that is currently selected
    NSURL *url = [sharedInstance.volumes objectAtIndex:sharedInstance.selectedVolume];
    
    //debugging - ensuring that the correct selected volume get passed.
    NSString *volumeName;
    NSError *error;
    [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
    NSLog(@"Volume (selected for Deletion): %@", volumeName);
    NSLog(@"URL Locator: %@", url);
    
    
    /*
     It is important that the Sandboxing entitlement of the application be turned off
     to allow the application to read and write to directories outside of the applications
     sandbox.
     However, keep in mind that the application can not be distributed through the OSX App Store
     if the Sandboxing entitlement is turned off.
     */
    
    
    //file write test
    //the following code was used to learn and experiment with how files are written in obj-c
    //it has been commented out as it is not essential to this portion of the application
    //it remains here to provide understanding of file writing functions.
    
    /*
    NSString *myStr = @"this is a string";
    NSURL *filePath = [url URLByAppendingPathComponent:@"test.txt"];
    NSLog(@"File Write Path: %@", filePath);
    BOOL filesuccess;
    NSError *fileError;
    filesuccess = [myStr writeToURL:filePath atomically:NO encoding:NSUTF8StringEncoding error:&fileError];
    NSLog(@"File Success: %@", filesuccess ? @"YES" : @"NO");
    NSLog(@"Error: %@", fileError);
     */
    
    
    //creating a file manager object for the drive that is currently selected
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator *en = [fm enumeratorAtURL:url includingPropertiesForKeys:@[NSURLNameKey, NSURLIsDirectoryKey] options:0 errorHandler:nil];
    
    // file listing loop
    for (NSURL *url in en) {
        NSLog(@"Files: %@", url);
    }
    
    //file deletion loop
    /*
     NSString* file;
     
     while (file = [en nextObject]) {
         res = [fm removeItemAtURL:url error:&err];
         if (!res && err) {
             NSLog(@"oops: %@", err);
         }
     */
}

