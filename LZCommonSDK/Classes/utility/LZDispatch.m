//
//  MTDCommonEvent.m
//  m4399_BabySong
//
//  Created by zhenwei on 14-9-24.
//  Copyright (c) 2014年 4399 Network Co. Ltd. All rights reserved.
//

#import "LZDispatch.h"
#import "NSUserDefaults+LZHelper.h"

const NSString* dispatchedTag = @"dispatched";

@implementation LZDispatch

/**
 *  处理一次
 *
 *  @param dispatchKey 唯一key
 *  @param handler 执行处理
 */
+ (void)dispatchIfNeedForKey:(NSString*)dispatchKey dispatchHandler:(dispatch_block_t)handler
{
    if ([NSUserDefaults valueForKey:dispatchKey] == nil) {
        if (handler) {
            handler();
        }
    }
}

+ (void)finishDispatchForKey:(NSString*)dispatchKey
{
    [NSUserDefaults setValue:dispatchedTag forKey:dispatchKey];
}

/**
 *  运行一次
 *
 *  @param dispatchKey  唯一key
 *  @param handler 执行处理
 */
+ (void)dispatchOnceForKey:(NSString*)dispatchKey dispatchHandler:(dispatch_block_t)handler
{
    if ([NSUserDefaults valueForKey:dispatchKey] == nil) {
        if (handler) {
            handler();
        }
        [NSUserDefaults setValue:dispatchedTag forKey:dispatchKey];
    }
}

/**
 *  运行几次
 *
 *  @param times   次数
 *  @param dispatchKey  唯一key
 *  @param handler 运行处理
 */
+ (void)dispatchForTimes:(NSInteger)times dispatchKey:(NSString*)dispatchKey dispatchHandler:(dispatch_block_t)handler
{
    NSInteger count = [NSUserDefaults integerForKey:dispatchKey];
    
    if (count < times) {
        if (handler) {
            handler();
        }
        [NSUserDefaults setInteger:++count forKey:dispatchKey];
    }
}


/**
 *  设置已运行次数
 *
 *  @param times  次数
 *  @param dispatchKey 唯一key
 */
+ (void)setDispatchedTimes:(NSInteger)times dispatchKey:(NSString*)dispatchKey
{
    [NSUserDefaults setInteger:times forKey:dispatchKey];
}


/**
 *  定时运行
 *
 *  @param thing     事件处理
 *  @param initerval 定时事件
 */
+ (dispatch_source_t)dispatch:(dispatch_block_t)thing interval:(NSTimeInterval)interval
{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_queue_create("com.mmc.clock", DISPATCH_QUEUE_SERIAL));
    dispatch_source_set_timer(timer, interval* NSEC_PER_SEC, interval * NSEC_PER_SEC, 0.25 * NSEC_PER_SEC);
    if (thing) {
        dispatch_source_set_event_handler(timer, thing);
    }
    dispatch_resume(timer);
}

+ (void)dispatch:(dispatch_block_t)thing afterDelays:(NSTimeInterval)delay
{
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        if (thing) {
            thing();
        }
    });
}

+ (void)dispatchAsync:(dispatch_block_t)thing
{
    if (thing) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),thing);;
    }
}


+ (void)dispatchAsyncOnMainThread:(dispatch_block_t)thing
{
    if (thing) {
        dispatch_async(dispatch_get_main_queue(),thing);
    }
}

+ (void)dispatchSyncOnMainThread:(dispatch_block_t)thing
{
    if (thing) {
        dispatch_sync(dispatch_get_main_queue(),thing);
    }
}

@end
