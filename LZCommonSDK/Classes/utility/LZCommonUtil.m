//
//  GSCommonUtil.m
//  GSCoreCommon
//
//  Created by zhenwei on 13-12-23.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import "LZCommonUtil.h"
#import <AVFoundation/AVFoundation.h>

@implementation LZCommonUtil

+ (BOOL)isEmpty:(id)thing
{
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

+ (BOOL)isNotEmpty:(id)thing
{
    return ![self isEmpty:thing];
}

BOOL IsNotNilAndNull(id obj)
{
    return (((obj) != nil) && (![(obj) isEqual:[NSNull null]]));
}

BOOL IsNilOrNull(id obj)
{
    return (((obj) == nil) || ([(obj) isEqual:[NSNull null]]));
}

NSString* SetEmptyStringIfNil(NSString* string)
{
    if (string == nil) {
        string = @"";
    }
    return string;
}

NSString* SetDefaultStringIfNil(NSString*string, NSString* defaultString)
{
    if (string == nil) {
        string = defaultString;
    }
    return string;
}

NSString* StringWithInteger(NSInteger value)
{
    return [NSString stringWithFormat:@"%ld", (long)value];
}

NSString* StringWithFloat(CGFloat value)
{
    return [NSString stringWithFormat:@"%f", value];
}

UIFont *FontWithSize(CGFloat size)
{
    return [UIFont systemFontOfSize:size];
}

UIFont *BlodFontWithSize(CGFloat size)
{
    return [UIFont boldSystemFontOfSize:size];
}

NSURL *URLWithString(NSString *string)
{
    return [NSURL URLWithString:string];
}

UIImage *imageNamed(NSString *name)
{
    return [UIImage imageNamed:name];
}

CGFloat DegreesToRadian(CGFloat degrees)
{
    return (M_PI * (degrees) / 180.0);
}

CGFloat RadianToDegrees(CGFloat radian)
{
    return (radian*180.0)/(M_PI);
}

BOOL CanRespondsToSelector(id target, NSString* selectorName)
{
    return YES;
}


@end
