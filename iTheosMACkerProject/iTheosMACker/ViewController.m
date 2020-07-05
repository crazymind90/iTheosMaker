//
//  ViewController.m
//  iTheosMACker
//
//  Created by CrazyMind90 on 11/04/2020.
//  Copyright © 2020 iTheosMACker. All rights reserved.
//

#import "ViewController.h"
#import "SSZipArchive.h"


 

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    
    _MakeProjectSty.hidden = YES;
    _TextaField.hidden = YES;
    _TargetBundle.hidden = YES;
    _CreateToPath.hidden = YES;
    _Save.hidden = YES;
    _PackageBundle.hidden = YES;
    
    
    
    NSString *PlistPath = [[NSBundle mainBundle] pathForResource:@"MtP" ofType:@"plist"];

    if (![[NSFileManager defaultManager] fileExistsAtPath:PlistPath]) {
        
 
        [self CreatePlistAtPath:[NSBundle mainBundle].resourcePath NameWithoutExtension:@"MtP"];
        
    }
    
    NSMutableDictionary *MutDict = [[NSMutableDictionary alloc] initWithContentsOfFile:PlistPath];
    NSString *GetPath = [MutDict objectForKey:@"CreateAtPath"];
    
    if (GetPath != NULL) {
        
        _CreateToPath.stringValue = GetPath;
    }
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)Seeg:(id)sender {
    
    [self performSelector:@selector(ShowContent) withObject:nil];

    
}



-(BOOL) CreatePlistAtPath:(NSString *)CreatePlistAtPath NameWithoutExtension:(NSString *)NameWithoutExtension {
        

    NSString *PlistPath = CreatePlistAtPath;
    
    NSString *PlistName = [PlistPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",NameWithoutExtension]];

    bool Success = [@{} writeToFile:PlistName atomically: YES];
    
    return Success;
    
    
}


-(void) ShowContent {
    
     _MakeProjectSty.hidden = NO;
     _TextaField.hidden = NO;
     _TargetBundle.hidden = NO;
     _CreateToPath.hidden = NO;
     _Save.hidden = NO;
     _PackageBundle.hidden = NO;

}



- (IBAction)Segaa:(id)sender {
    
    switch (_Segm.selectedSegment) {
        case 0:
        _TargetBundle.hidden = NO;
        _PackageBundle.hidden = NO;
        _TextaField.hidden = NO;
        _CreateToPath.hidden = NO;
        _MakeProjectSty.hidden = NO;
        _Save.hidden = NO;
        _PackageBundle.placeholderString = @"Package Bundle";
        _CreateToPath.placeholderString = @"Create To Path";
            break;
            
            
        case 1:
        _TargetBundle.hidden = NO;
        _PackageBundle.hidden = NO;
        _TextaField.hidden = NO;
        _CreateToPath.hidden = NO;
        _MakeProjectSty.hidden = NO;
        _Save.hidden = NO;
        _PackageBundle.placeholderString = @"Package Bundle";
        _CreateToPath.placeholderString = @"Create To Path";
            break;
            
            
        case 2:
        _TargetBundle.hidden = YES;
        _CreateToPath.hidden = NO;
        _MakeProjectSty.hidden = NO;
        _PackageBundle.hidden = NO;
        _TextaField.hidden = NO;
        _Save.hidden = NO;
        _PackageBundle.placeholderString = @"iPA Path";
        _CreateToPath.placeholderString = @"Create To Path";
            
            break;
            
            
        default:
            break;
    }
}




- (IBAction)MakeProject:(id)sender {
    
     switch (_Segm.selectedSegment) {
             
             
             
             
            case 0:
             
                [self performSelector:@selector(SimpleTweak) withObject:nil];
             
                _MakeProjectSty.hidden = NO;
                _TextaField.hidden = NO;
                _TargetBundle.hidden = NO;
                _CreateToPath.hidden = NO;
                _Save.hidden = NO;

                break;

             
              
             
                case 1:
             
                [self performSelector:@selector(PrefBundle) withObject:nil];
                _MakeProjectSty.hidden = NO;
                _TextaField.hidden = NO;
                _TargetBundle.hidden = NO;
                _CreateToPath.hidden = NO;
                _Save.hidden = NO;
             
               break;
                
            
             
             
               case 2:
                         
                [self performSelector:@selector(TheosJailed) withObject:nil];
                _MakeProjectSty.hidden = NO;
                _TextaField.hidden = NO;
                _TargetBundle.hidden = NO;
                _CreateToPath.hidden = NO;
                _Save.hidden = NO;
             
               break;
             
             
             
            default:
                break;
             
        }
        

}



-(void) TheosJailed {
    
    
       NSString *TextaFieldFixer = [_TextaField.stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];

         
       if ([_CreateToPath.stringValue isEqual:@""] && [TextaFieldFixer isEqual:@""]) {
           
           
       } else {
       
       NSFileManager *FileManager = [NSFileManager defaultManager];

       if ([FileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]]) {
           
           NSWindow *window  = [NSApplication sharedApplication].keyWindow;
           NSAlert *alert = [NSAlert new];
           alert.messageText = @"You already have a project with this name";
           alert.informativeText = @"!";
           [alert addButtonWithTitle:@"OK"];
           
           [alert beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
               
           }];
           
       } else {
       
       NSURL *TheosPath = [[NSBundle mainBundle] URLForResource:@"TheosJailed" withExtension:@"zip"];
       NSString *TheosOrig = TheosPath.path;
       
           
       NSString *_CreateToPathFix = [_CreateToPath.stringValue stringByReplacingOccurrencesOfString:@" " withString:@"\\ "];
           
           [self CreateDirAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPathFix,TextaFieldFixer]];
           
           [SSZipArchive unzipFileAtPath:TheosOrig toDestination:[NSString stringWithFormat:@"%@/%@",_CreateToPathFix,TextaFieldFixer]];
           
           [self ChangeFileNameAtPath:[NSString stringWithFormat:@"%@/%@/CC.plist",_CreateToPathFix,TextaFieldFixer] To:[NSString stringWithFormat:@"%@/%@/%@.plist",_CreateToPathFix,TextaFieldFixer,TextaFieldFixer]];
           
           
 
        
           
       // IPAPath
       // Makefile File
       NSString *MakefilePath = [NSString stringWithFormat:@"%@/%@/Makefile",_CreateToPathFix,TextaFieldFixer];
       NSString *allocFile2 = [NSString stringWithContentsOfFile:MakefilePath encoding:NSUTF8StringEncoding error:nil];
       NSString *Replace2 = [allocFile2 stringByReplacingOccurrencesOfString:@"CC" withString:TextaFieldFixer];
           NSString *Replace3 = [Replace2 stringByReplacingOccurrencesOfString:@"IPAPath" withString:[_PackageBundle.stringValue stringByReplacingOccurrencesOfString:@" " withString:@"\\ "]];
       [Replace3 writeToFile:MakefilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
  
       
       
       if ([FileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]]) {
           
           NSWindow *window  = [NSApplication sharedApplication].keyWindow;
           NSAlert *alert = [NSAlert new];
           alert.messageText = @"Successfully Created :)";
           alert.informativeText = @"Done";
           [alert addButtonWithTitle:@"OK"];
           
           [alert beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
               
           }];
           
       }
       
       
       }
       
       }
       
       
       
    
}

 




- (IBAction)SavePathButton:(id)sender {
    

    NSString *TheosOrig = [[NSBundle mainBundle] pathForResource:@"MtP" ofType:@"plist"];
    
    NSMutableDictionary *MutDict = [[NSMutableDictionary alloc] initWithContentsOfFile:TheosOrig];
    [MutDict setValue:_CreateToPath.stringValue forKey:@"CreateAtPath"];
    [MutDict writeToFile:TheosOrig atomically:YES];
    
}



    

-(void) ChangeFileNameAtPath:(NSString *)ChangeFileName To:(NSString *)To {

    
    [[NSFileManager defaultManager] moveItemAtPath:[NSString stringWithFormat:@"%@",ChangeFileName] toPath:[NSString stringWithFormat:@"%@",To] error:nil];

    
}


-(void) CreateDirAtPath:(NSString *)Path {
    
      [[NSFileManager defaultManager] createDirectoryAtPath:Path withIntermediateDirectories:YES attributes:nil error:nil];
}





-(void) PrefBundle {
    


        NSString *TextaFieldFixer = [_TextaField.stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];



        if (![_CreateToPath.stringValue isEqual:@""] && ![TextaFieldFixer isEqual:@""]) {



        NSFileManager *FileManager = [NSFileManager defaultManager];

        if ([FileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]]) {

        NSWindow *window  = [NSApplication sharedApplication].keyWindow;
        NSAlert *alert = [NSAlert new];
        alert.messageText = @"You already have a project with this name";
        alert.informativeText = @"!";
        [alert addButtonWithTitle:@"OK"];

        [alert beginSheetModalForWindow:window completionHandler:^(NSInteger result) {

        }];

        } else {


        NSURL *TheosPath = [[NSBundle mainBundle] URLForResource:@"TheosPref" withExtension:@"zip"];
        NSString *TheosOrig = TheosPath.path;





        [self CreateDirAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]];

        [SSZipArchive unzipFileAtPath:TheosOrig toDestination:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]];

        [self ChangeFileNameAtPath:[NSString stringWithFormat:@"%@/%@/comCC.plist",_CreateToPath.stringValue,TextaFieldFixer] To:[NSString stringWithFormat:@"%@/%@/%@.plist",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer]];


        [self ChangeFileNameAtPath:[NSString stringWithFormat:@"%@/%@/comCC",_CreateToPath.stringValue,TextaFieldFixer] To:[NSString stringWithFormat:@"%@/%@/%@",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer]];



        NSString *PackageBunLowerCase = [_PackageBundle.stringValue lowercaseString];


        // Control File
        NSString *ControlPath = [NSString stringWithFormat:@"%@/%@/control",_CreateToPath.stringValue,TextaFieldFixer];
        NSString *allocFile = [NSString stringWithContentsOfFile:ControlPath encoding:NSUTF8StringEncoding error:nil];
        NSString *Replace = [allocFile stringByReplacingOccurrencesOfString:@"comCC" withString:_TextaField.stringValue];
        NSString *Replace3 = [Replace stringByReplacingOccurrencesOfString:@"com.crazymind90.jxxfsgtq" withString:PackageBunLowerCase];
        [Replace3 writeToFile:ControlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];



        // Makefile File
        NSString *MakefilePath = [NSString stringWithFormat:@"%@/%@/Makefile",_CreateToPath.stringValue,TextaFieldFixer];
        NSString *allocFile2 = [NSString stringWithContentsOfFile:MakefilePath encoding:NSUTF8StringEncoding error:nil];
        NSString *Replace2 = [allocFile2 stringByReplacingOccurrencesOfString:@"comCC" withString:TextaFieldFixer];
        [Replace2 writeToFile:MakefilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];


        // Plist
        NSString *Plist = [NSString stringWithFormat:@"%@/%@/%@.plist",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *PlistBrowser = [NSString stringWithContentsOfFile:Plist encoding:NSUTF8StringEncoding error:nil];
        NSString *Replacer = [PlistBrowser stringByReplacingOccurrencesOfString:@"com.apple.UIKit" withString:_TargetBundle.stringValue];
        [Replacer writeToFile:Plist atomically:YES encoding:NSUTF8StringEncoding error:nil];


        // entry
        NSString *TextaFieldFixed = [TextaFieldFixer stringByReplacingOccurrencesOfString:@" " withString:@""];

        NSString *entry = [NSString stringWithFormat:@"%@/%@/%@/entry.plist",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *BrowseEntry = [NSString stringWithContentsOfFile:entry encoding:NSUTF8StringEncoding error:nil];

        NSString *ReplacerB = [BrowseEntry stringByReplacingOccurrencesOfString:@"comCC" withString:TextaFieldFixer];
        NSString *ReplPP = [ReplacerB stringByReplacingOccurrencesOfString:@"BundleControllerRootListController" withString:[NSString stringWithFormat:@"%@Controller",TextaFieldFixed]];
        [ReplPP writeToFile:entry atomically:YES encoding:NSUTF8StringEncoding error:nil];



        // Makefile2 File

        NSString *MakefilePath2 = [NSString stringWithFormat:@"%@/%@/%@/Makefile",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *allocFile3 = [NSString stringWithContentsOfFile:MakefilePath2 encoding:NSUTF8StringEncoding error:nil];
        NSString *Reple = [allocFile3 stringByReplacingOccurrencesOfString:@"comCC" withString:TextaFieldFixer];
        NSString *Replq = [Reple stringByReplacingOccurrencesOfString:@"BundleControllerRootListController.m" withString:[NSString stringWithFormat:@"%@Controller.m",TextaFieldFixed]];
        [Replq writeToFile:MakefilePath2 atomically:YES encoding:NSUTF8StringEncoding error:nil];


        // Bundle.h File
        NSString *BundleDotH = [NSString stringWithFormat:@"%@/%@/%@/BundleControllerRootListController.h",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *All = [NSString stringWithContentsOfFile:BundleDotH encoding:NSUTF8StringEncoding error:nil];
        NSString *Rep = [All stringByReplacingOccurrencesOfString:@"BundleControllerRootListController" withString:[NSString stringWithFormat:@"%@Controller",TextaFieldFixed]];
        [Rep writeToFile:BundleDotH atomically:YES encoding:NSUTF8StringEncoding error:nil];


        [[NSFileManager defaultManager] moveItemAtPath:[NSString stringWithFormat:@"%@/%@/%@/BundleControllerRootListController.h",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer] toPath:[NSString stringWithFormat:@"%@/%@/%@/%@Controller.h",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer,TextaFieldFixed] error:nil];





        // Bundle.m File
        NSString *BundleDotM = [NSString stringWithFormat:@"%@/%@/%@/BundleControllerRootListController.m",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *All1 = [NSString stringWithContentsOfFile:BundleDotM encoding:NSUTF8StringEncoding error:nil];
        NSString *Rep1 = [All1 stringByReplacingOccurrencesOfString:@"BundleControllerRootListController" withString:[NSString stringWithFormat:@"%@Controller",TextaFieldFixed]];
        [Rep1 writeToFile:BundleDotM atomically:YES encoding:NSUTF8StringEncoding error:nil];



        [self ChangeFileNameAtPath:[NSString stringWithFormat:@"%@/%@/%@/BundleControllerRootListController.m",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer] To:[NSString stringWithFormat:@"%@/%@/%@/%@Controller.m",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer,TextaFieldFixed]];






        // Info File
        NSString *InfoP = [NSString stringWithFormat:@"%@/%@/%@/Resources/Info.plist",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *allo = [NSString stringWithContentsOfFile:InfoP encoding:NSUTF8StringEncoding error:nil];
        NSString *Replaps = [allo stringByReplacingOccurrencesOfString:@"comCC" withString:TextaFieldFixer];
        NSString *Replapss = [Replaps stringByReplacingOccurrencesOfString:@"com.cc" withString:PackageBunLowerCase];
        NSString *ReplOP = [Replapss stringByReplacingOccurrencesOfString:@"BundleControllerRootListController" withString:[NSString stringWithFormat:@"%@Controller",TextaFieldFixed]];
        [ReplOP writeToFile:InfoP atomically:YES encoding:NSUTF8StringEncoding error:nil];



        // Root File
        NSString *Root = [NSString stringWithFormat:@"%@/%@/%@/Resources/Root.plist",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *allosss = [NSString stringWithContentsOfFile:Root encoding:NSUTF8StringEncoding error:nil];
        NSString *Replss = [allosss stringByReplacingOccurrencesOfString:@"comCC" withString:TextaFieldFixer];
        NSString *RWWWW = [Replss stringByReplacingOccurrencesOfString:@"com.cc" withString:PackageBunLowerCase];
        [RWWWW writeToFile:Root atomically:YES encoding:NSUTF8StringEncoding error:nil];

        // Tweak File
        NSString *Tweak = [NSString stringWithFormat:@"%@/%@/Tweak.xm",_CreateToPath.stringValue,TextaFieldFixer];
        NSString *als = [NSString stringWithContentsOfFile:Tweak encoding:NSUTF8StringEncoding error:nil];
        NSString *Replw = [als stringByReplacingOccurrencesOfString:@"com.cc" withString:PackageBunLowerCase];
        [Replw writeToFile:Tweak atomically:YES encoding:NSUTF8StringEncoding error:nil];

        if ([FileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]]) {

        NSWindow *window  = [NSApplication sharedApplication].keyWindow;
        NSAlert *alert = [NSAlert new];
        alert.messageText = @"Successfully Created :)";
        alert.informativeText = @"Done";
        [alert addButtonWithTitle:@"OK"];

        [alert beginSheetModalForWindow:window completionHandler:^(NSInteger result) {

        }];

        }


        }

        }
    
    
}















-(void) SimpleTweak {
            
    NSString *TextaFieldFixer = [_TextaField.stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];

      
    if (![_CreateToPath.stringValue isEqual:@""] && ![TextaFieldFixer isEqual:@""]) {
        
    
    
    NSFileManager *FileManager = [NSFileManager defaultManager];

    if ([FileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]]) {
        
        NSWindow *window  = [NSApplication sharedApplication].keyWindow;
        NSAlert *alert = [NSAlert new];
        alert.messageText = @"You already have a project with this name";
        alert.informativeText = @"!";
        [alert addButtonWithTitle:@"OK"];
        
        [alert beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
            
        }];
        
    } else {
    
    NSURL *TheosPath = [[NSBundle mainBundle] URLForResource:@"TheosOrig" withExtension:@"zip"];
    NSString *TheosOrig = TheosPath.path;
    
        
        [self CreateDirAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]];
        
        [SSZipArchive unzipFileAtPath:[NSString stringWithFormat:@"%@",TheosOrig] toDestination:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]];
        
        [self ChangeFileNameAtPath:[NSString stringWithFormat:@"%@/%@/CC.plist",_CreateToPath.stringValue,TextaFieldFixer] To:[NSString stringWithFormat:@"%@/%@/%@.plist",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer]];
    
    
        NSString *PackageBunLowerCase = [_PackageBundle.stringValue lowercaseString];
 
    
    // Control File
        NSString *ControlPath = [NSString stringWithFormat:@"%@/%@/control",_CreateToPath.stringValue,TextaFieldFixer];
    NSString *allocFile = [NSString stringWithContentsOfFile:ControlPath encoding:NSUTF8StringEncoding error:nil];
        NSString *Replace = [allocFile stringByReplacingOccurrencesOfString:@"CC" withString:_TextaField.stringValue];
    NSString *Replace3 = [Replace stringByReplacingOccurrencesOfString:@"com.cc" withString:PackageBunLowerCase];
    [Replace3 writeToFile:ControlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
        
    
    // Makefile File
    NSString *MakefilePath = [NSString stringWithFormat:@"%@/%@/Makefile",_CreateToPath.stringValue,TextaFieldFixer];
    NSString *allocFile2 = [NSString stringWithContentsOfFile:MakefilePath encoding:NSUTF8StringEncoding error:nil];
    NSString *Replace2 = [allocFile2 stringByReplacingOccurrencesOfString:@"CC" withString:TextaFieldFixer];
    [Replace2 writeToFile:MakefilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    
    // Plist
    
        NSString *Plist = [NSString stringWithFormat:@"%@/%@/%@.plist",_CreateToPath.stringValue,TextaFieldFixer,TextaFieldFixer];
        NSString *PlistBrowser = [NSString stringWithContentsOfFile:Plist encoding:NSUTF8StringEncoding error:nil];
        NSString *Replacer = [PlistBrowser stringByReplacingOccurrencesOfString:@"com.apple.springboard" withString:_TargetBundle.stringValue];
        [Replacer writeToFile:Plist atomically:YES encoding:NSUTF8StringEncoding error:nil];

        
    
    
    if ([FileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",_CreateToPath.stringValue,TextaFieldFixer]]) {
        
        NSWindow *window  = [NSApplication sharedApplication].keyWindow;
        NSAlert *alert = [NSAlert new];
        alert.messageText = @"Successfully Created :)";
        alert.informativeText = @"Done";
        [alert addButtonWithTitle:@"OK"];
        
        [alert beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
            
        }];
        
    }
    
    
    }
    
    }
    
    
    
    
                
}

- (IBAction)CrazyMind90:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"https://twitter.com/CrazyMind90"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

@end
