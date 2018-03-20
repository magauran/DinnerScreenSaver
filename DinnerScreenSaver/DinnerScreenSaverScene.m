//
//  DinnerScreenSaverScene.m
//  DinnerScreenSaver
//
//  Created by Алексей on 17.02.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "DinnerScreenSaverScene.h"
#import "NSColor+Hex.h"

#define kDefaultsModuleName [NSBundle bundleForClass:[self class]].bundleIdentifier

@interface DinnerScreenSaverScene() {
 @private
    SKLabelNode *_timerLabel;
    SKLabelNode *_dinnerLabel;
    NSTimer *_timer;
    NSInteger _seconds;
}
@end


@implementation DinnerScreenSaverScene


- (void)sceneDidLoad {
    [self setBackgroundColor: [NSColor colorFromHexadecimalValue:[[self defaults] objectForKey:@"backgroundColor"]]];
    _seconds = [[self defaults] integerForKey:@"time"];
    [self setupLabels];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:true];
    
}

- (void)setupLabels {
    [_timerLabel setAlpha:0.0];
    _timerLabel = [[SKLabelNode alloc] init];
    [_timerLabel setText:[NSString stringWithFormat:@"%02ld:%02ld", (_seconds / 60), (_seconds  % 60)]];
    [_timerLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [_timerLabel setVerticalAlignmentMode:SKLabelVerticalAlignmentModeTop];
    [_timerLabel setFontName:@"Eurostile Bold"];
    [_timerLabel setColor:[NSColor colorFromHexadecimalValue:[[self defaults] objectForKey:@"textColor"]]];
    [_timerLabel setFontSize:64];
    [_timerLabel setPosition:CGPointMake(self.size.width / 2, self.size.height / 2)];
    [self addChild:_timerLabel];
    [_timerLabel setAlpha:1.0];
    
    SKLabelNode *_dinnerLabel = [[SKLabelNode alloc] init];
    [_dinnerLabel  setText:[[self defaults] stringForKey: @"text"]];
    [_dinnerLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [_dinnerLabel setVerticalAlignmentMode:SKLabelVerticalAlignmentModeBottom];
    [_dinnerLabel setFontName:@"Eurostile"];
    [_dinnerLabel setColor:[NSColor colorFromHexadecimalValue:[[self defaults] objectForKey:@"textColor"]]];
    [_dinnerLabel setFontSize:32];
    [_dinnerLabel setPosition:CGPointMake(self.size.width / 2, self.size.height / 2 + 10)];
    [self addChild:_dinnerLabel];
}

- (void)updateTimer {
    if (_seconds)
        _seconds--;
    
    [_timerLabel setText:[NSString stringWithFormat:@"%02ld:%02ld", (_seconds / 60), (_seconds  % 60)]];
}

- (ScreenSaverDefaults *) defaults {
    return [ScreenSaverDefaults defaultsForModuleWithName: kDefaultsModuleName];
}

@end
