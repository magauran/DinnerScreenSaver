//
//  DinnerScreenSaverScene.m
//  DinnerScreenSaver
//
//  Created by Алексей on 17.02.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "DinnerScreenSaverScene.h"

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
    [self setBackgroundColor:[NSColor blackColor]];
    [self setupLabels];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:true];
    _seconds = 3600;
}

- (void)setupLabels {
    _timerLabel = [[SKLabelNode alloc] init];
    [_timerLabel  setText:@"60:00"];
    [_timerLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [_timerLabel setVerticalAlignmentMode:SKLabelVerticalAlignmentModeTop];
    [_timerLabel setFontName:@"Eurostile Bold"];
    [_timerLabel setColor:[NSColor whiteColor]];
    [_timerLabel setFontSize:64];
    [_timerLabel setPosition:CGPointMake(self.size.width / 2, self.size.height / 2)];
    [self addChild:_timerLabel];
    
    SKLabelNode *_dinnerLabel = [[SKLabelNode alloc] init];
    [_dinnerLabel  setText:@"До конца обеда:"];
    [_dinnerLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [_dinnerLabel setVerticalAlignmentMode:SKLabelVerticalAlignmentModeBottom];
    [_dinnerLabel setFontName:@"Eurostile"];
    [_dinnerLabel setColor:[NSColor whiteColor]];
    [_dinnerLabel setFontSize:32];
    [_dinnerLabel setPosition:CGPointMake(self.size.width / 2, self.size.height / 2 + 10)];
    [self addChild:_dinnerLabel];
}

- (void)updateTimer {
    if (_seconds)
        _seconds--;
    [_timerLabel setText:[NSString stringWithFormat:@"%ld:%ld", (_seconds / 60), (_seconds  % 60)]];
}

@end
