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

/**
 *  是否可见
 *
 *  @return 是否可见
 */
- (BOOL)isVisible;

@end
