//
//  DinnerScreenSaverScene.h
//  DinnerScreenSaver
//
//  Created by Алексей on 17.02.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <ScreenSaver/ScreenSaver.h>

@interface DinnerScreenSaverScene : SKScene

@property (copy, nonatomic) NSString *textString;
@property (strong, nonatomic) NSColor *backColor;
@property (strong, nonatomic) NSColor *textColor;

@end


