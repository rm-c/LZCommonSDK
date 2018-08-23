//
//  LZReachabilityUtil.h
//  GSCoreCommon
//
//  Created by zhenwei on 13-11-14.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    LZNetworkStatusWIFI     = 0,
    LZNetworkStatus3G       = 1,
    LZNetworkStatusOFFLINE  = 2
    
} LZNetworkStatus;

#define NETWORK_STATUS_KEY   @"LZNetworkStatusKey"
#define NETWORK_TEST_WEBSITE @"www.baidu.com"

@interface LZReachabilityUtil : NSObject

/**
 *  注册网络状态变化监听者
 *
 *  @param observer  外部观察者，如果为空，则使用内置默认观察者
 *  @param aSelector 外部通知接收方法，如果为空，则使用内置默认方法
 *  @param anObject  事件接收对象，默认为空
 */
+ (void)registerReachabilityChangedObserver:(id)observer selector:(SEL)aSelector object:(id)anObject;

/**
 *  默认网络状态变化监听者
 */
+ (void)registerReachabilityChangedObserver;

// add by zhenwei
+ (void)unregisterReachabilityChangedObserver:(id)observer;
// end

/**
 *  获取缓存的网络状态
 *
 *  @return 网络状态值
 */
+ (LZNetworkStatus)getCachedNetworkStatus;

/**
 *  获取当前的网络状态
 *
 *  @return 网络状态值
 */
+ (LZNetworkStatus)getCurrentNetworkStatus;

@end
