//
//  NSDictionary+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LZHelper)

/**
 *  返回排线key数组
 *
 *  @return 排序后的数组
 */
- (NSArray*)sortedKeys;

- (id)keyForIndex:(NSUInteger)index;

- (id)objectForKeyIndex:(NSUInteger)index;

- (id)objectForIndexPath:(NSIndexPath*)indexPath;

/**
 *  返回排线key数组
 *
 *  @return 反序数组
 */
- (NSArray*)desortedKeys;

- (id)dekeyForIndex:(NSUInteger)index;

- (id)deobjectForKeyIndex:(NSUInteger)index;

- (id)deobjectForIndexPath:(NSIndexPath*)indexPath;

- (NSIndexPath*)indexPathForObject:(id)object;

@end
