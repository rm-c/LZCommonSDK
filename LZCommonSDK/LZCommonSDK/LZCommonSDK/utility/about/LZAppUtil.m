//
//  GSAppUtil.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LZAppUtil.h"
#import "LZCommonUtil.h"
#import "LZMacroDefine.h"

@implementation LZAppUtil

+ (NSString*)getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString*)getBundleID
{
    NSString* idntifier = [[NSBundle mainBundle]bundleIdentifier];
    
    return idntifier;
}

+ (NSString*)getAppDisplayName
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    
    return appName;
}

+ (BOOL)isAppFirstLaunch
{
    BOOL hasLaunchedOnce = [[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"];
    
    if (!hasLaunchedOnce) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return !hasLaunchedOnce;
}

+ (BOOL)isAppFirstLaunchForThisVersion
{
    NSString* version = [self getAppVersion];
    if (IsEmpty(version)) {
        return NO;
    }
    BOOL hasLaunched = [[NSUserDefaults standardUserDefaults] boolForKey:version];
    
    if (!hasLaunched) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:version];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return !hasLaunched;
}

@end
