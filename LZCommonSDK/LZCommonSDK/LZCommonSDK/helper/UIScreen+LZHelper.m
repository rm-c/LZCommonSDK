//
//  UIScreen+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIScreen+LZHelper.h"

@implementation UIScreen (LZHelper)

+ (CGSize)size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]doubleValue];
    BOOL isLand = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion >8.0 && isLand) ? sizeSwap([UIScreen size]) : [UIScreen size];
}

+ (CGFloat)orientationWidth
{
    return [UIScreen orientationSize].width;
}

+ (CGFloat)orientationHeight
{
    return [UIScreen orientationSize].height;
}

+ (CGSize)DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize sizeSwap(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

@end
