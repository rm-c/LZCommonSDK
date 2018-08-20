//
//  GSRandomUtil.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZRandomUtil : NSObject

/**
 *  获取count个不重复的随机数
 *
 *  @param count 随机数个数
 *
 *  @return 随机数数组
 */
+ (NSMutableArray*)getNoRepeatRandomNumbers:(int)count;

/**
 *  最小随机值
 *
 *  @param minValue 最小值
 *
 *  @return 最小随机值
 */
+ (NSInteger)randomFromValue:(NSInteger)minValue;

/**
 *  最大随机值
 *
 *  @param maxValue 最大值
 *
 *  @return 最大随机值
 */
+ (NSInteger)randomToValue:(NSInteger)maxValue;

/**
 *  区间随机值
 *
 *  @param minValue 最小值
 *  @param maxValue 最大值
 *
 *  @return 期间随机值
 */
+ (NSInteger)randomFromValue:(NSInteger)minValue toValue:(NSInteger)maxValue;

@end
