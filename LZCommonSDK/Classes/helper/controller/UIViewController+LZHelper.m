//
//  UIViewController+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIViewController+LZHelper.h"
#import "UIView+LZFrame.h"

@implementation UIViewController (LZHelper)

- (UIViewController*)rootViewController
{
    if (self.parentViewController) {
        return [self.parentViewController rootViewController];
    }
    else{
        return self;
    }
}

- (UIViewController*)lastPresentedViewController
{
    if (self.presentedViewController) {
        return [self.presentedViewController lastPresentedViewController];
    }
    else{
        return self;
    }
}

- (UIViewController*)lastPresentingViewController
{
    if (self.presentingViewController) {
        return [self.presentingViewController lastPresentingViewController];
    }
    else{
        return self;
    }
}

- (BOOL)isVisible
{
    return [self isViewLoaded] && self.view.window;
}

/**
 *  视图悬空
 *
 *  @param scrollView          父view
 *  @param subView             被添加的view
 *  @param yOnScrollView       子视图在scrollView上的坐标
 *  @param yToContainView      子视图在ContainView上的坐标
 *
 */
- (void)suspendSubViewIfNeed:(UIView*)subView
              formScrollView:(UIScrollView *)scrollView
               yOnScrollView:(CGFloat)yOnScrollView
                      toView:(UIView *)toView
              yToSuspendView:(CGFloat)yToSuspendView
{
    
    CGFloat offsetY = scrollView.contentOffset.y + yToSuspendView;
    
    if (offsetY >= yOnScrollView) {
        [subView setY1:yToSuspendView];
        [subView removeFromSuperview];
        [toView addSubview:subView];
    }
    else if (offsetY <= yOnScrollView + subView.height){
        [subView setY1:yOnScrollView];
        [subView removeFromSuperview];
        [scrollView addSubview:subView];
    }
}

@end
