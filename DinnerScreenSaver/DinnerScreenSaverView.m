//
//  DinnerScreenSaverView.m
//  DinnerScreenSaver
//
//  Created by Алексей on 17.02.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "DinnerScreenSaverView.h"
#import "DinnerScreenSaverScene.h"

@implementation DinnerScreenSaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        SKView *sceneView = [[SKView alloc] initWithFrame:frame];
        sceneView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self addSubview:sceneView];
        DinnerScreenSaverScene *scene = [[DinnerScreenSaverScene alloc] initWithSize:frame.size];
        [sceneView presentScene: scene];
    }
    return self;
}

- (BOOL)hasConfigureSheet {
    return NO;
}

- (NSWindow*)configureSheet {
    return nil;
}

@end
