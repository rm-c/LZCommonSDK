//
//  NSArray+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LZHelper)

/**
 *  循环上一个
 *
 *  @param currentIndex 当前索引
 *
 *  @return 循环上一个
 */
- (id)prevByLoop:(NSInteger*)currentIndex;
- (id)nextByLoop:(NSInteger*)currentIndex;

/**
 *  上一个
 *
 *  @param currentIndex 当前索引
 *
 *  @return 上一个
 */
- (id)prevNoLoop:(NSInteger*)currentIndex;
- (id)nextNoLoop:(NSInteger*)currentIndex;

/**
 *  数组排序
 *
 *  @param keyString   keySting
 *  @param isAscending 是否升序
 *
 *  @return 新的排序数组
 */
- (NSArray*)sortedArrayUsingKeyString:(NSString *)keyString isAscending:(BOOL)isAscending;

/**
 *  倒数第几个对象
 *
 *  @param index 倒数
 *
 *  @return 反序对象
 */
- (id)objectAtReverseIndex:(NSUInteger)index;

/**
 *  数组翻转
 *
 *  @return 翻转数组
 */
- (NSArray*)reverseArray;

/**
 *  随机排序
 *
 *  @return 随机排序数组
 */
- (NSArray*)randomSorted;

@end
