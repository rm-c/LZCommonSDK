//
//  GSScreenUtil.m
//  GSCoreCommon
//
//  Created by zhenwei on 13-11-20.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import "LZScreenUtil.h"


@implementation LZScreenUtil

+ (float) getVerticalWidthOfScreen
{
    return MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

+ (float) getVerticalHeightOfScreen
{
    return MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

+ (float) getHorizontalWidthOfScreen
{
    return MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

+ (float) getHorizontalHeightOfScreen
{
    return MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

+ (float) getStatusBarHeight
{
    float statusWidth  = [[UIApplication sharedApplication] statusBarFrame].size.width;
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    return statusWidth < statusHeight ? statusWidth:statusHeight;
}

@end
