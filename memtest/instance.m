//
//  instance.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-27.
//

#import <Foundation/Foundation.h>
#import "instance.h"
#import "drivedetect.h"

@implementation Instance

static Instance *sharedInstance = nil;

+(Instance*)sharedInstance{
    @synchronized([Instance class]) {
        if (!sharedInstance){
            sharedInstance = [[self alloc] init];
        }
        return sharedInstance;
    }
    return nil;
}

+(id)alloc {
    @synchronized([Instance class])
    {
        NSAssert(sharedInstance == nil, @"Singleton already initialized.");
        sharedInstance = [super alloc];
        return sharedInstance;
    }
    return nil;
}

-(id)init {
    self = [super init];
    if (self != nil) {
        
        //TODO: Initialize Variables in here for the instance.
        self.fileSize = 1024576;
        self.volumes = drivedetect();
        
    }   return self;
}

void refreshDrive(void){
    //refreshing the drives
    sharedInstance.volumes = drivedetect();
}

@end
