//
//  GSRandomUtil.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LZRandomUtil.h"

@implementation LZRandomUtil

/**
 *  获取count个不重复的随机数
 *
 *  @param count 随机数个数
 *
 *  @return 随机数数组
 */
+ (NSMutableArray*)getNoRepeatRandomNumbers:(int)count
{
    NSMutableArray *initArray = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < count; i++) {
        NSNumber* num = [NSNumber numberWithInt:i];
        [initArray addObject:num];
    }
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        int index = arc4random() % (count - i);
        [resultArray addObject:[initArray objectAtIndex:index]];
        [initArray removeObjectAtIndex:index];
    }
    
    return resultArray;
}

+ (NSInteger)randomFromValue:(NSInteger)minValue
{
    return arc4random() + minValue;
}

+ (NSInteger)randomToValue:(NSInteger)maxValue
{
    return arc4random() / maxValue;
}

+ (NSInteger)randomFromValue:(NSInteger)minValue toValue:(NSInteger)maxValue
{
    return (arc4random() + minValue) / maxValue;
}

@end
