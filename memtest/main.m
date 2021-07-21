//
//  main.m
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-20.
//

#import <Cocoa/Cocoa.h>
#import "drivedetect.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {}
    
   

    //TODO
    //1.External Drive Detection (Total Space, Free Space, Format)
    //2.Write File
    //3.Research Algorithm for Writing Raw Dummy Test Files
    //4.Read File and Analyze (Bit-by-bit or CRC32 or Hash Check?)
    //5.GUI
    
    NSMutableArray *bob = drivedetect();    
    
    
    //NSFileHandle *write;
    //write = [NSFileHandle fileHandleForWritingAtPath:<#(nonnull NSString *)#>
    
    
    return NSApplicationMain(argc, argv);
}
