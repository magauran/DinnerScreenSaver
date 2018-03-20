//
//  DinnerScreenSaverView.m
//  DinnerScreenSaver
//
//  Created by Алексей on 17.02.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "DinnerScreenSaverView.h"
#import "DinnerScreenSaverScene.h"
#import "ConfigureSheet.h"

#define kDefaultsModuleName [NSBundle bundleForClass:[self class]].bundleIdentifier

@interface DinnerScreenSaverView()

@end

@implementation DinnerScreenSaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        SKView *sceneView = [[SKView alloc] initWithFrame:frame];
        sceneView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self addSubview:sceneView];
        DinnerScreenSaverScene *scene = [[DinnerScreenSaverScene alloc] initWithSize:frame.size];
       // NSString *text = [[self defaults] stringForKey:@"text"];
        scene.textString = @"lolololololo";
        scene.backColor = [NSColor redColor];
        scene.textColor = [NSColor yellowColor];

        [sceneView presentScene: scene];
    }
    return self;
}

- (BOOL)hasConfigureSheet
    {
        return YES;
    }
    
- (NSWindow*)configureSheet {
    if (!configureSheet)
    {
        configureSheet = [[ConfigureSheet alloc] initWithWindowNibName:@"ConfigureSheet"];
    }
    return [configureSheet window];
}

- (ScreenSaverDefaults *) defaults {
    return [ScreenSaverDefaults defaultsForModuleWithName: kDefaultsModuleName];
}

@end
