//
//  UIView+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/22.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LZAddedSubviewHandler)(UIView* subView, UIView* superView);


@interface UIView (LZHelper)

- (UIViewController *)viewController; // 视图对应的控制器

/**
 *  获取视图第一响应者
 *
 *  @return 视图第一响应者
 */
- (UIView *)firstResponder;

- (void)setCornerRadius:(CGFloat)cornerRadius;  // 设置cornerRadius
- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor;  // 设置border


#pragma mark - 实用方法

/**
 *  添加子视图并适配子视图大小
 *
 *  @param view 姿势图
 */
- (void)addSubviewEx:(UIView *)view;

/**
 *  删除子视图
 *
 *  @param tag 子视图tag
 */
- (void)removeSubviewWithTag:(NSInteger)tag;
- (void)removeAllSubviews;  // 删除所有子视图

- (void)addBlurEffect; //添加毛玻璃效果
- (void)removeBlurEffect; //删除毛玻璃效果

- (UIImage*)capture;//截图

+ (void)addSubView:(UIView*)subView toSuperView:(UIView*)superView addedCallback:(LZAddedSubviewHandler)handler;

@end
