//
//  UIColor+LZHelper.m
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/14.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIColor+LZHelper.h"

@implementation UIColor (LZHelper)

+ (instancetype)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    
    return [self colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:1.0];
}

+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];
}

+ (UIColor *)randomColor
{
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

- (UIColor *)invertedColor
{
    return [UIColor colorWithR:255 - self.red G:255 - self.green B:255 - self.blue A:self.alpha];
}

#pragma mark - Hex from Color

- (NSString *)hexString
{
    NSArray *colorArray	= [self rgbaArray];
    int r = [colorArray[0] floatValue] * 255;
    int g = [colorArray[1] floatValue] * 255;
    int b = [colorArray[2] floatValue] * 255;
    NSString *red = [NSString stringWithFormat:@"%02x", r];
    NSString *green = [NSString stringWithFormat:@"%02x", g];
    NSString *blue = [NSString stringWithFormat:@"%02x", b];
    
    return [NSString stringWithFormat:@"#%@%@%@", red, green, blue];
}

#pragma mark - RGBA from Color
- (NSArray *)rgbaArray
{
    CGFloat r=0,g=0,b=0,a=0;
    
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    
    return @[@(r),
             @(g),
             @(b),
             @(a)];
}

- (CGFloat)red
{
    return [[self rgbaArray][0] floatValue];
}

- (CGFloat)green
{
    return [[self rgbaArray][1] floatValue];
}

- (CGFloat)blue
{
    return [[self rgbaArray][2] floatValue];
}

- (CGFloat)alpha
{
    return [[self rgbaArray][3] floatValue];
}

#pragma mark - RGBA Helper method

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}


@end
