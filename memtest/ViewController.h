//
//  ViewController.h
//  memtest
//
//  Created by Akashdeep Dhami on 2021-07-20.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

void initDriveUI(void);

@property (weak) IBOutlet NSPopUpButtonCell *list;

- (IBAction)testButton:(id)sender;
- (IBAction)updateDropDown:(id)sender;
- (IBAction)refresh:(id)sender;

@property (weak) IBOutlet NSTextField *txtDiskName;
@property (weak) IBOutlet NSTextField *txtTotalSize;

@property (weak) IBOutlet NSTextField *txtFreeSpace;

@end

