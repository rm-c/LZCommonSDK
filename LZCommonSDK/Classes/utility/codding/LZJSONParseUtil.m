//
//  GSJSONParseUtil.m
//  GSCoreCommon
//
//  Created by zhenwei on 13-12-16.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import "LZJSONParseUtil.h"

@implementation LZJSONParseUtil

+ (long long)getLongValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    id tmp = nil;
    
    @try {
        tmp = [dict objectForKey:key];
    }
    @catch (NSException *exception) {
        NSLog(@"很遗憾的跟你说，程序出错了：%@",exception);
    }
    
    if (tmp == nil)
    {
        return 0;
    }
    
    if ([tmp isKindOfClass:[NSNumber class]]) {
        return [tmp longLongValue];
    }
    
    if ([tmp isKindOfClass:[NSString class]]) {
        return [tmp longLongValue];
    }
    
    return 0;
}

+ (NSUInteger)getIntValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    id tmp = nil;
    
    @try {
        tmp = [dict objectForKey:key];
    }
    @catch (NSException *exception) {
        NSLog(@"很遗憾的跟你说，程序出错了：%@",exception);
    }
    
    if (tmp == nil)
    {
        return 0;
    }
    
    if ([tmp isKindOfClass:[NSNumber class]] || [tmp isKindOfClass:[NSString class]]) {
        return [tmp integerValue];
    }
    
    return 0;
}

+ (BOOL)getBoolValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    id tmp = nil;
    
    @try {
        tmp = [dict objectForKey:key];
    }
    @catch (NSException *exception) {
        NSLog(@"很遗憾的跟你说，程序出错了：%@",exception);
    }
    
    if (tmp == nil)
    {
        return NO;
    }
    
    if ([tmp isKindOfClass:[NSNumber class]] || [tmp isKindOfClass:[NSString class]]) {
        return [tmp boolValue];
    }
    
    return NO;
}

+ (float)getFloatValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    id tmp = nil;
    
    @try {
        tmp = [dict objectForKey:key];
    }
    @catch (NSException *exception) {
        NSLog(@"很遗憾的跟你说，程序出错了：%@",exception);
    }
    
    if (tmp == nil)
    {
        return 0.0f;
    }
    
    if ([tmp isKindOfClass:[NSNumber class]] || [tmp isKindOfClass:[NSString class]]) {
        return [tmp floatValue];
    }
    
    return 0.0f;
}

+ (NSNumber*)getNumberValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    return [LZJSONParseUtil getDataInDict:dict withKey:key ofClass:[NSNumber class]];
}

+ (NSString*)getStringValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    NSString* str = [LZJSONParseUtil getDataInDict:dict withKey:key ofClass:[NSString class]];
    if (str == nil) {
        NSNumber* num = [LZJSONParseUtil getDataInDict:dict withKey:key ofClass:[NSNumber class]];
        if (num != nil) {
            return  num.stringValue;
        }
    }
    return str;
}

+ (NSDictionary*)getDictionaryValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    return [LZJSONParseUtil getDataInDict:dict withKey:key ofClass:[NSDictionary class]];
}

+ (NSArray*)getArrayValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    return [LZJSONParseUtil getDataInDict:dict withKey:key ofClass:[NSArray class]];
}

+ (NSMutableArray*)getMutableArrayValueInDict:(NSDictionary*)dict withKey:(NSString*)key
{
    NSArray* resultArray = [LZJSONParseUtil getArrayValueInDict:dict withKey:key];
    
    return [NSMutableArray arrayWithArray:resultArray];
}

+ (id)getDataInDict:(NSDictionary*)dict withKey:(NSString*)key ofClass:(Class)class
{
    id temp = nil;
    
    @try {
        temp = [dict objectForKey:key];
    }
    @catch (NSException *exception) {
        NSLog(@"很遗憾的跟你说，程序出错了：%@",exception);
    }
    
    if (temp == nil)
    {
        return nil;
    }
    
    return [temp isKindOfClass:class]?temp:nil;
}

@end
