//
//  ViewController.h
//  iTheosMACker
//
//  Created by CrazyMind90 on 11/04/2020.
//  Copyright © 2020 iTheosMACker. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (strong) IBOutlet NSTextField *TextaField;
@property (strong) IBOutlet NSTextField *CreateToPath;
@property (strong) IBOutlet NSTextField *TargetBundle;
@property (strong) IBOutlet NSButton *MakeProjectSty;
@property (strong) IBOutlet NSSegmentedControl *Segm;
@property (strong) IBOutlet NSButton *Save;
@property (strong) IBOutlet NSTextField *PackageBundle;

@end

