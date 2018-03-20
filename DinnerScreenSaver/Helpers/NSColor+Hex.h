//
//  NSColor+Hex.h
//  DinnerScreenSaver
//
//  Created by Алексей on 20.03.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (Hex)

- (NSString *)hexadecimalValue;
+ (NSColor *)colorFromHexadecimalValue:(NSString *)hex;

@end
