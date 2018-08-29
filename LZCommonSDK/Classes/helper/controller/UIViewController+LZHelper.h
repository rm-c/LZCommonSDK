//
//  UIViewController+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LZHelper)

- (UIViewController*)rootViewController;

- (UIViewController*)lastPresentedViewController;

- (UIViewController*)lastPresentingViewController;

- (BOOL)isVisible;  // 是否可见

/**
 视图悬空

 @param subView 被添加的view
 @param scrollView 父view
 @param yOnScrollView 子视图在scrollView上的坐标
 @param toView 目标视图
 @param yToSuspendView 子视图在ContainView上的坐标
 */
- (void)suspendSubViewIfNeed:(UIView*)subView
              formScrollView:(UIScrollView *)scrollView
               yOnScrollView:(CGFloat)yOnScrollView
                      toView:(UIView *)toView
              yToSuspendView:(CGFloat)yToSuspendView;

@end
