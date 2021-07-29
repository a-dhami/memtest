//
//  main.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-20.
//

#import <Cocoa/Cocoa.h>
#import "instance.h"
#import "drivedetect.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {}
    
    Instance *sharedInstance = [Instance sharedInstance];   

    //TODO
    //1.External Drive Detection (Total Space, Free Space, Format)
    //2.Write File
    //3.Research Algorithm for Writing Raw Dummy Test Files
    //4.Read File and Analyze (Bit-by-bit or CRC32 or Hash Check?)
    //5.GUI
    
   
    
    
    
    
    //NSFileHandle *write;
    //write = [NSFileHandle fileHandleForWritingAtPath:<#(nonnull NSString *)#>
    
    
    return NSApplicationMain(argc, argv);
}
