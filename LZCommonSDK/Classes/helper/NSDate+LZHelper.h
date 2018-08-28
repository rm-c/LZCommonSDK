//
//  NSDate+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define             GS_DATE_FORMATE_DATE_TIME            @"yyyy-MM-dd HH:mm:ss"
#define             GS_DATE_FORMATE_DATE                 @"yyyy-MM-dd"
#define             GS_DATE_FORMATE_TIME                 @"HH:mm:ss"

@interface NSDate (LZHelper)

- (NSInteger)year;

- (NSInteger)month;

- (NSInteger)day;

- (NSInteger)weekday;

- (NSInteger)hour;

- (NSInteger)minute;

- (NSInteger)second;

#pragma mark - 相关判断

- (BOOL)isToday;

- (BOOL)isYesterday;

- (BOOL)isTomorrow;

- (BOOL)isThisYear;

- (BOOL)isWeekend;

- (BOOL)isWorkday;

+ (BOOL)isSameDay:(NSDate*)day1 and:(NSDate*)day2;

+ (BOOL)isDay:(NSDate*)date1 before:(NSDate*)date2;

#pragma mark - 简便方法

/**
 *  转换yyyy-MM-dd HH:mm:ss格式时间
 *
 *  @param dateString yyyy-MM-dd HH:mm:ss
 *
 *  @return data
 */
+ (NSDate*)dateWithDateString:(NSString*)dateString;

/**
 *  转换格式时间
 *
 *  @param dateString 时间字符串
 *  @param formatString  格式字符串
 *
 *  @return date
 */
+ (NSDate *)dateWithDateString:(NSString *)dateString formatString:(NSString *)formatString;

+ (NSDate*)dateWithBeijing:(NSDate*)date; // 将iOS默认GMT时间转换为北京时间

+ (NSDate *)localDate; // 获取本地时间

#pragma mark - 实用方法

/**
 *  将日期转换为指定格式的时间字符串
 *
 *  @param format 格式
 *
 *  @return 指定格式的时间字符串
 */
- (NSString*)dateStringWithFormat:(NSString*)format;

@end
