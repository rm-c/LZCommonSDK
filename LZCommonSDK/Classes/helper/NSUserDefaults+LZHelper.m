//
//  NSUserDefaults+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSUserDefaults+LZHelper.h"

@implementation NSUserDefaults (LZHelper)

+ (void)setValue:(id)value forKey:(NSString *)key
{
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    [def setValue:value forKey:key];
    [def synchronize];
}

+ (id)valueForKey:(NSString *)key
{
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    id value = [def valueForKey:key];
    return value;
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)key
{
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    [def setInteger:value forKey:key];
    [def synchronize];
}

+ (NSInteger)integerForKey:(NSString *)key
{
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    NSInteger value = [def integerForKey:key];
    return value;
}

- (void)removeAllDefaults
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];

}

@end
