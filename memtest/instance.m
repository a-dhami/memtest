//
//  instance.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-27.
//

#import <Foundation/Foundation.h>
#import "instance.h"

@implementation Instance

static Instance * instance = nil;

+(Instance*)sharedInstance{
    @synchronized([Instance class]) {
        if (!instance){
            instance = [[self alloc] init];
        }
        return instance;
    }
    return nil;
}

+(id)alloc {
    @synchronized([Instance class])
    {
        NSAssert(instance == nil, @"Singleton already initialized.");
        instance = [super alloc];
        return instance;
    }
    return nil;
}

-(id)init {
    self = [super init];
    if (self != nil) {
        
        //TODO: Initialize Variables in here for the instance.
    }   return self;
}

@end
