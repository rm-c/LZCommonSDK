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

+ (UIImage*) getAppIcon
{
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    return [UIImage imageNamed:icon];
}

+ (UIImage *)launchImage
{
    UIImage *imageP = [self launchImageWithType:@"Portrait" ];
    if(imageP)
        return imageP;
    UIImage *imageL = [self launchImageWithType:@"Landscape"];
    if(imageL)
        return imageL;
    NSLog(@"获取LaunchImage失败!请检查是否添加启动图,或者规格是否有误.");
    return nil;
}

+ (UIImage *) launchImageWithType:(NSString *)type {
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = type;
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if([viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            if([dict[@"UILaunchImageOrientation"] isEqualToString:@"Landscape"])
            {
                imageSize = CGSizeMake(imageSize.height, imageSize.width);
            }
            if(CGSizeEqualToSize(imageSize, viewSize))
            {
                launchImageName = dict[@"UILaunchImageName"];
                UIImage *image = [UIImage imageNamed:launchImageName];
                return image;
            }
        }
    }
    return nil;
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
    if (LzIsEmpty(version)) {
        return NO;
    }
    BOOL hasLaunched = [[NSUserDefaults standardUserDefaults] boolForKey:version];
    
    if (!hasLaunched) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:version];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return !hasLaunched;
}

- (void)openAppSetting
{
     [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

@end
