//
//  NSDate+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSDate+LZHelper.h"

@implementation NSDate (LZHelper)

- (NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self];
    return [components year];
}

- (NSInteger)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:self];
    return [components month];
}

- (NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:self];
    return [components day];
}

- (NSInteger)weekday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    return [components weekday];
}

- (NSInteger)hour
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour fromDate:self];
    return [components hour];
}

- (NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMinute fromDate:self];
    return [components minute];
}

- (NSInteger)second
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond fromDate:self];
    return [components second];
}

#pragma mark - 相关判断

+ (BOOL)isSameDay:(NSDate*)day1 and:(NSDate*)day2
{
    NSInteger interval = [[[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                                          fromDate:day1
                                                            toDate:day2
                                                           options:0] day];
    BOOL isSame = NO;
    
    if(interval == 0)
    {
        isSame = YES;
    }
    
    return isSame;
}

+ (BOOL)isDay:(NSDate*)date1 before:(NSDate*)date2
{
    NSInteger interval = [[[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                                          fromDate:date1
                                                            toDate:date2
                                                           options:0] day];
    BOOL isBefore = NO;
    
    if(interval<=0)
    {
        isBefore = NO;
    }
    else
    {
        isBefore = YES;
    }
    
    return isBefore;
}

- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    return selfCmps.year == nowCmps.year  &&selfCmps.month == nowCmps.month  &&selfCmps.day == nowCmps.day;
}

- (BOOL)isYesterday
{
    //生成只有年月日的日期对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfString = [fmt stringFromDate:self];
    NSDate * selfDate = [fmt dateFromString:selfString];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    //比较差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit  unit = NSCalendarUnitYear |
    NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    return  cmps.year == 0 && cmps.month == 0 && cmps.day == 1 ;
}

- (BOOL)isTomorrow
{
    //生成只有年月日的日期对象
    NSDateFormatter *fmr = [[NSDateFormatter alloc]init];
    fmr.dateFormat=@"yyyy-MM-dd";
    NSString *selfString = [fmr stringFromDate:self];
    NSDate  * selfDate = [fmr  dateFromString:selfString];
    NSString *nowString = [fmr stringFromDate:[NSDate date]];
    NSDate  *nowDate = [fmr dateFromString:nowString];
    NSCalendar *calendar = [NSCalendar  currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar  components:unit fromDate:selfDate toDate:nowDate options:0];
    return cmps.year == 0 && cmps.month == 0 && cmps.day == -1;
}

- (BOOL)isThisYear
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSInteger  selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    return selfYear == nowYear;
}

- (BOOL)isWeekend
{
    return self.weekday == 1 || self.weekday == 7;
}

- (BOOL)isWorkday
{
    return ![self isWeekend];
}

#pragma mark - 简便方法

+ (NSDate*)dateWithDateString:(NSString*)dateString
{
    return [self dateWithDateString:dateString formatString:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSDate *)dateWithDateString:(NSString *)dateString formatString:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

+ (NSDate*)dateWithBeijing:(NSDate*)date
{
    NSTimeZone * zone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    return localeDate;
}

+ (NSDate*)dateWithYear:(int)year month:(int)month day:(int)day
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}

+ (NSDate*)dateWithYear:(int)year
                  month:(int)month
                    day:(int)day
                   hour:(int)hour
                 minute:(int)minute
                 second:(int)second
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    return [calendar dateFromComponents:components];
}

#pragma mark - 实用方法

- (NSString*)dateStringWithFormat:(NSString*)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}


@end
