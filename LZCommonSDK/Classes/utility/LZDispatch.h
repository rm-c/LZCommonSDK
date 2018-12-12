//
//  MTDCommonEvent.h
//  m4399_BabySong
//
//  Created by zhenwei on 14-9-24.
//  Copyright (c) 2014年 4399 Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LZDispatch : NSObject

#pragma mark - 执行次数
//-----------------------------------条件执行-----------------------------------
/**
 *  处理一次(从应用程序安装开始计算)
 *
 *  @param dispatchKey NSUserDefaults唯一key
 *  @param handler 执行处理
 */
+ (void)dispatchIfNeedForKey:(NSString*)dispatchKey dispatchHandler:(dispatch_block_t)handler;

/**
 *  完成处理
 *
 *  @param dispatchKey NSUserDefaults唯一key
 */
+ (void)finishDispatchForKey:(NSString*)dispatchKey;

//-----------------------------------执行一次-----------------------------------

/**
 *  运行一次(从应用程序安装开始计算)
 *
 *  @param dispatchKey  NSUserDefaults唯一key
 *  @param handler 执行处理
 */
+ (void)dispatchOnceForKey:(NSString*)dispatchKey dispatchHandler:(dispatch_block_t)handler;

//-----------------------------------限次执行-----------------------------------
/**
 *  运行几次(从应用程序安装开始计算)
 *
 *  @param times   次数
 *  @param dispatchKey  NSUserDefaults唯一key
 *  @param handler 运行处理
 */
+ (void)dispatchForTimes:(NSInteger)times dispatchKey:(NSString*)dispatchKey dispatchHandler:(dispatch_block_t)handler;


/**
 *  设置已运行次数
 *
 *  @param times  次数
 *  @param dispatchKey NSUserDefaults唯一key
 */
+ (void)setDispatchedTimes:(NSInteger)times dispatchKey:(NSString*)dispatchKey;

#pragma mark - 定时执行
/**
 *  定时运行
 *
 *  @param thing     事件处理
 *  @param interval 定时事件
 */
+ (dispatch_source_t)dispatch:(dispatch_block_t)thing interval:(NSTimeInterval)interval;

/**
 *  延时执行
 *
 *  @param thing 执行操作
 *  @param delay 延时时间
 */
+ (void)dispatch:(dispatch_block_t)thing afterDelays:(NSTimeInterval)delay;


#pragma mark - 线程执行

/**
 *  异步线程执行
 *
 *  @param thing 执行处理
 */
+ (void)dispatchAsync:(dispatch_block_t)thing;

/**
 *  异步主线程执行
 *
 *  @param thing 执行处理
 */
+ (void)dispatchAsyncOnMainThread:(dispatch_block_t)thing;

/**
 *  同步主线程执行
 *
 *  @param thing 执行处理
 */
+ (void)dispatchSyncOnMainThread:(dispatch_block_t)thing;

@end
