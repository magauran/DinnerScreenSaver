//
//  NSColor+Hex.m
//  DinnerScreenSaver
//
//  Created by Алексей on 20.03.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "NSColor+Hex.h"

@implementation NSColor (Hex)

- (NSString *)hexadecimalValue {
    
    CGFloat redFloatValue, greenFloatValue, blueFloatValue;
    NSInteger redIntValue, greenIntValue, blueIntValue;
    NSString *redHexValue, *greenHexValue, *blueHexValue;
    
    NSColor *convertedColor = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    
    if (convertedColor) {
        [convertedColor getRed:&redFloatValue green:&greenFloatValue blue:&blueFloatValue alpha:nil];
        
        redIntValue = redFloatValue * 255.99999f;
        greenIntValue = greenFloatValue * 255.99999f;
        blueIntValue = blueFloatValue * 255.99999f;
        
        redHexValue = [NSString stringWithFormat:@"%02lx", (long)redIntValue];
        greenHexValue = [NSString stringWithFormat:@"%02lx", (long)greenIntValue];
        blueHexValue = [NSString stringWithFormat:@"%02lx", (long)blueIntValue];
        
        return [NSString stringWithFormat:@"#%@%@%@", redHexValue, greenHexValue, blueHexValue];
    }
    
    return nil;
}

+ (NSColor *)colorFromHexadecimalValue:(NSString *)hex {
    
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringWithRange:NSMakeRange(1, [hex length] - 1)];
    }
    
    unsigned int colorCode = 0;
    
    if (hex) {
        NSScanner *scanner = [NSScanner scannerWithString:hex];
        [scanner scanHexInt:&colorCode];
    }
    
    return [NSColor colorWithDeviceRed:((colorCode >> 16) & 0xFF) / 255.0
                                 green:((colorCode >> 8) & 0xFF) / 255.0
                                  blue:(colorCode & 0xFF) / 255.0 alpha:1.0];
}

@end
