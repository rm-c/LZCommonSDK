//
//  UIWebView+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (LZHelper)

/**
 *  清除网页背景色
 */
- (void)clearWebViewBackground;

/**
 *  加载Url
 *
 *  @param url url地址
 */
- (void)loadUrl:(NSString*)url;

/**
 *  加载url编码后的url
 *
 *  @param url url编码后的url
 */
- (void)loadCodedUrl:(NSString*)url;

/**
 *  获取当前页面URL
 *
 *  @return 当前页面URL
 */
- (NSString *)getCurrentURL;

/**
 *  获取标题
 *
 *  @return 获取标题
 */
- (NSString *)getTitle;

@end
