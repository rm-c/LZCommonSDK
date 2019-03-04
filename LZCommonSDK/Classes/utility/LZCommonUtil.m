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

NSString* LZStringWithInteger(NSInteger value)
{
    return [NSString stringWithFormat:@"%ld", (long)value];
}

NSString* LZStringWithFloat(CGFloat value)
{
    return [NSString stringWithFormat:@"%f", value];
}

UIFont *LZFontWithSize(CGFloat size)
{
    return [UIFont systemFontOfSize:size];
}

UIFont *LZBlodFontWithSize(CGFloat size)
{
    return [UIFont boldSystemFontOfSize:size];
}

NSURL *LZURLWithString(NSString *string)
{
    return [NSURL URLWithString:string];
}

UIImage *LZImageNamed(NSString *name)
{
    return [UIImage imageNamed:name];
}

CGFloat LZDegreesToRadian(CGFloat degrees)
{
    return (M_PI * (degrees) / 180.0);
}

CGFloat LZRadianToDegrees(CGFloat radian)
{
    return (radian*180.0)/(M_PI);
}

BOOL LZCanRespondsToSelector(id target, NSString* selectorName)
{
    return [target respondsToSelector:NSSelectorFromString(selectorName)];
}

NSMutableString* joinObjs(NSArray* objs)
{
    return joinObjsEx(objs, @"");
}

NSMutableString* joinObjsEx(NSArray* objs, NSString* separator)
{
    NSMutableString* s = [NSMutableString string];
    [objs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (s.length > 0) {
            [s appendString:separator];
        }
        [s appendString:[NSString stringWithFormat:@"%@", obj]];
    }];
    return s;
}

@end
