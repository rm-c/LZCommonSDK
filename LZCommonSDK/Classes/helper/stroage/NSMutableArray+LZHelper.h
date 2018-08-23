//
//  NSMutableArray+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (LZHelper)

/**
 *  添加对象, 如果对象为空, 则不添加
 *
 *  @param anObject 对象
 */
- (void)addObjectSafely:(id)anObject;

/**
 *  添加对象, 如果对象为空, 添加空对象
 *
 *  @param anObject 对象
 */
- (void)addObjectWithNullObjectIfAddObjectNil:(id)anObject;

/**
 *  随机排序
 */
- (void)randomSorted;

@end
