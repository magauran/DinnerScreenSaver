//
//  ConfigureSheet.m
//  DinnerScreenSaver
//
//  Created by Алексей on 19.03.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "ConfigureSheet.h"
#import <ScreenSaver/ScreenSaver.h>
#import "NSColor+Hex.h"

#define kDefaultsModuleName [NSBundle bundleForClass:[self class]].bundleIdentifier

@interface ConfigureSheet ()

@property (weak) IBOutlet NSButton *buttonClose;
@property (weak) IBOutlet NSTextField *timeTextField;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSColorWell *textColorWell;
@property (weak) IBOutlet NSColorWell *backgroundColorWell;

@end

@implementation ConfigureSheet

- (void)windowDidLoad {
    [super windowDidLoad];
    NSDictionary *infoDictionary;
    infoDictionary = [[NSBundle bundleForClass:self.class] infoDictionary];
}

- (id)initWithWindowNibName:(NSString *)windowNibName owner:(id)owner {
    self = [super initWithWindowNibName:windowNibName owner:owner];
    return self;
}

- (IBAction)closeConfigureSheet:(NSButton *)sender {
    [[self defaults] setInteger:self.timeTextField.integerValue * 60 forKey:@"time"];
    [[self defaults] setObject:self.textField.stringValue forKey:@"text"];
    [[self defaults] setObject:[self.textColorWell.color hexadecimalValue] forKey:@"textColor"];
    [[self defaults] setObject:[self.backgroundColorWell.color hexadecimalValue] forKey:@"backgroundColor"];
    [[self defaults] synchronize];
    
    [[NSApplication sharedApplication] endSheet:[self window]];
}

- (ScreenSaverDefaults *) defaults {
    return [ScreenSaverDefaults defaultsForModuleWithName: kDefaultsModuleName];
}

@end
