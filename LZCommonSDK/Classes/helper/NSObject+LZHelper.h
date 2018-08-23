//
//  NSObject+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GSPerformEventHandler)(NSObject* object, id param);

@interface NSObject (LZHelper)

#pragma mark - 事件处理

/**
 *  事件响应
 *
 *  @param handler 事件处理
 *  @param param   参数
 *  @param delay   延时
 */
- (void)performEventHandler:(GSPerformEventHandler)handler param:(id)param afterDelay:(NSTimeInterval)delay;

#pragma mark - 实用方法

/**
 *  设置associated对象
 *
 *  @param value 值
 *  @param key   key
 */
- (void)setAssociatedObject:(id)value forKey:(const NSString *)key;

- (void)setWeakAssociateValue:(id)value forKey:(const NSString *)key;

- (void)setCopyAssociateValue:(id)value forKey:(const NSString *)key;

/**
 *  获取associated对象
 *
 *  @param key key
 *
 *  @return associated对象
 */
- (id)getAssociatedObjectForKey:(const NSString *)key;

/**
 *  获取类名
 *
 *  @return 类名字符串
 */
- (NSString*)className;

@end
