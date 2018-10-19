//
//  GSStringUtil.h
//  GSCoreCommon
//
//  Created by zhenwei on 13-12-16.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZStringUtil : NSObject

/**
 *  从itunesUrl解析出来
 *
 *  @param itunesUrl 应用在AppStore的地址
 *
 *  @return 应用id
 */
+ (NSString*)parseAppIdFromItunesURL:(NSString*)itunesUrl;

+ (BOOL)isEmptyString:(NSString*)string;    // 判断是否为空字符串

+ (NSString *)UTF8StringToUnicode:(NSString *)UTF8String; // utf8字符串转换成unicode

- (NSString *)getNumberFromStr:(NSString *)str;

@end
