//
//  GSReachabilityUtil.m
//  GSCoreCommon
//
//  Created by zhenwei on 13-11-14.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import "LZReachabilityUtil.h"
#import "GSReachability.h"


@implementation LZReachabilityUtil

+ (id)sharedInstance
{
    //用来标记block是否已经执行过
    static dispatch_once_t p = 0;
    
    //初始化，只有第一次执行到
    __strong static id _sharedObject = nil;
    
    //执行对象初始化，程序生命周期内，只执行一次
    dispatch_once(&p, ^{
        _sharedObject = [[LZReachabilityUtil alloc] init];
    });
    
    return _sharedObject;
}

+ (void)registerReachabilityChangedObserver:(id)observer selector:(SEL)aSelector object:(id)anObject
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSUserDefaults* uesrDefaults = [NSUserDefaults standardUserDefaults];
        [uesrDefaults setInteger:[LZReachabilityUtil getCurrentNetworkStatus] forKey:NETWORK_STATUS_KEY];
        
        GSReachability * reach = [GSReachability reachabilityWithHostname:@"www.baidu.com"];
        
        if (observer != nil && aSelector != nil) //外部自定义网络变化监听
        {
            [[NSNotificationCenter defaultCenter] addObserver:observer
                                                     selector:aSelector
                                                         name:kGSReachabilityChangedNotification
                                                       object:anObject];
        }
        else
        {
            
//            [[NSNotificationCenter defaultCenter] addObserver:[GSReachabilityUtil sharedInstance]
//                                                     selector:@selector(handleReachabilityChanged:)
//                                                         name:kReachabilityChangedNotification
//                                                       object:anObject];
            
            reach.reachableBlock = ^(GSReachability * reachability)
            {
                NetworkStatus status = [reachability currentReachabilityStatus];
                
                if (status == ReachableViaWWAN)
                {
                    NSLog(@"block-3g");
                    [uesrDefaults setInteger:GSNetworkStatus3G forKey:NETWORK_STATUS_KEY];
                }
                else if (status == ReachableViaWiFi)
                {
                    NSLog(@"block-wifi");
                    [uesrDefaults setInteger:GSNetworkStatusWIFI forKey:NETWORK_STATUS_KEY];
                }
                
            };

            reach.unreachableBlock = ^(GSReachability * reachability)
            {
                NSLog(@"block-无网络");
                [uesrDefaults setInteger:GSNetworkStatusOFFLINE forKey:NETWORK_STATUS_KEY];
                
            };
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [reach startNotifier];
            
        });
    });
    
    
}

// add by zhenwei
+ (void)unregisterReachabilityChangedObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kGSReachabilityChangedNotification object:nil];
}
// end

+ (void)registerReachabilityChangedObserver
{
    [LZReachabilityUtil registerReachabilityChangedObserver:nil selector:nil object:nil];
}

+ (GSNetworkStatus)getCachedNetworkStatus
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    GSNetworkStatus netWorkStatus = (GSNetworkStatus)[userDefaults integerForKey:NETWORK_STATUS_KEY];
    
    return netWorkStatus;
}

+ (GSNetworkStatus)getCurrentNetworkStatus
{
    GSNetworkStatus result = GSNetworkStatusWIFI;
    GSReachability * reach = [GSReachability reachabilityWithHostname:@"www.baidu.com"];
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:// 没有网络连接
            result=GSNetworkStatusOFFLINE;
            break;
        case ReachableViaWWAN:// 使用3G网络
            result=GSNetworkStatus3G;
            break;
        case ReachableViaWiFi:// 使用WiFi网络
            result=GSNetworkStatusWIFI;
            break;
    }
    
    return result;
}

- (void)handleReachabilityChanged:(NSNotification *)note
{
    GSReachability *currReach = [note object];
    
    NSUserDefaults* uesrDefaults = [NSUserDefaults standardUserDefaults];
    
    NetworkStatus status = [currReach currentReachabilityStatus];
    
    switch (status) {
        case NotReachable:// 没有网络连接
            NSLog(@"无网络");
            [uesrDefaults setInteger:GSNetworkStatusOFFLINE forKey:NETWORK_STATUS_KEY];
            break;
        case ReachableViaWWAN:// 使用3G网络
            NSLog(@"3g");
            [uesrDefaults setInteger:GSNetworkStatus3G forKey:NETWORK_STATUS_KEY];
            break;
        case ReachableViaWiFi:// 使用WiFi网络
            NSLog(@"wifi");
            [uesrDefaults setInteger:GSNetworkStatusWIFI forKey:NETWORK_STATUS_KEY];
            break;
    }
    
}

@end
