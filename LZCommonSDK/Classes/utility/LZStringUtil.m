//
//  GSStringUtil.m
//  GSCoreCommon
//
//  Created by zhenwei on 13-12-16.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import "LZStringUtil.h"

@implementation LZStringUtil

+ (int)getStringRealLength:(NSString *)string
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [string dataUsingEncoding:enc];
    return (int)[da length];
}

+ (NSString*)parseAppIdFromItunesURL:(NSString*)itunesUrl
{
    NSArray* splits = [itunesUrl componentsSeparatedByString:@"/"]; //将字符串用/分割
    NSString* lastOfRequest = [splits objectAtIndex:[splits count]-1];
    
    //每个应用id格式都是类似：id639516529?mt=8
    NSArray* subSplits = [lastOfRequest componentsSeparatedByString:@"?"];
    NSString* appId = [subSplits objectAtIndex:0];
    if ([appId hasPrefix:@"id"]) {
        appId = [appId substringFromIndex:2];
    }
    
    return appId;
}

+ (BOOL)isEmptyString:(NSString*)string
{
    if (string == nil) {
        return YES;
    }
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)UTF8StringToUnicode:(NSString *)UTF8String
{   // utf8 to unicode
    NSUInteger length = [UTF8String length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    NSString *tem;
    for (int i = 0;i < length; i++) {
        unichar _char = [UTF8String characterAtIndex:i];
        [s appendString:@"\\u"];
        int j = _char >> 8;     // 取出高8位
        tem = [NSString stringWithFormat:@"%x",j];
        if (tem.length == 1) {
            [s appendString:@"0"];
        }
        [s appendString:tem];
        
        j = _char & 0xFF;      // 取出低八位
        tem = [NSString stringWithFormat:@"%x",j];
        if (tem.length == 1) {
            [s appendString:@"0"];
        }
        [s appendString:tem];
    }
    return s;
}

- (NSString *)getNumberFromStr:(NSString *)str
{
    NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return [[str componentsSeparatedByCharactersInSet:nonDigitCharacterSet] componentsJoinedByString:@""];
}

+ (BOOL)isBlankString:(NSString *)str {
    NSString *string = [str description];
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"])
    {
        return YES;
    }else
    {
        return NO;
    }
}

@end
