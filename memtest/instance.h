//
//  instance.h
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-27.
//

#ifndef instance_h
#define instance_h


#import <Foundation/Foundation.h>

@interface Instance : NSObject
@property (nonatomic) int fileSize;
@property (nonatomic, strong) NSMutableArray *volumes;

+(Instance *) sharedInstance;

void refreshDrive(void);


@end


#endif /* instance_h */
