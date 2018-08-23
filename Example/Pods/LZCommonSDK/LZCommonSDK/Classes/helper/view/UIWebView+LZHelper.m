//
//  UIWebView+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIWebView+LZHelper.h"

@implementation UIWebView (LZHelper)

- (void)clearWebViewBackground
{
    UIView *subView = [self.subviews lastObject];
    for (UIView *temp in subView.subviews)
    {
        if ([temp isKindOfClass:[UIImageView class]])
        {
            [temp setHidden:YES];
        }
    }
}

- (void)loadUrl:(NSString*)url
{
    if (url == nil) {
        return;
    }
    
    NSString* codeUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest* req = [NSURLRequest requestWithURL:[NSURL URLWithString:codeUrl]];
    [self loadRequest:req];
}

- (void)loadCodedUrl:(NSString*)url
{
    if (url == nil) {
        return;
    }
    NSURLRequest* req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self loadRequest:req];
}

/// 获取当前页面URL
- (NSString *)getCurrentURL
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.location.href"];
}
/// 获取标题
- (NSString *)getTitle
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
