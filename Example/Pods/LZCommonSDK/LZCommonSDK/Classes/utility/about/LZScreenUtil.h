//
//  GSScreenUtil.h
//  GSCoreCommon
//
//  Created by zhenwei on 13-11-20.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZScreenUtil : NSObject

/**
 *  获取竖屏模式下的屏幕宽度
 *
 *  @return 屏幕宽度
 */
+ (float) getVerticalWidthOfScreen;

/**
 *  获取竖屏模式下的屏幕高度
 *
 *  @return 屏幕高度
 */
+ (float) getVerticalHeightOfScreen;

/**
 *  获取横屏模式下的屏幕宽度
 *
 *  @return 屏幕宽度
 */
+ (float) getHorizontalWidthOfScreen;

/**
 *  获取横屏模式下的屏幕高度
 *
 *  @return 屏幕高度
 */
+ (float) getHorizontalHeightOfScreen;

/**
 *  获取状态栏高度
 *
 *  @return 状态栏高度
 */
+ (float) getStatusBarHeight;

@end
