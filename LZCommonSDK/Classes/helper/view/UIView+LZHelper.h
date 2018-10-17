//
//  UIView+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/22.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LZAddedSubviewHandler)(UIView* subV, UIView* supV);
typedef void(^LZAddedSubviewWithVCHandler)(UIViewController* subVC, UIView* supV);


@interface UIView (LZHelper)

- (UIViewController *)viewController; // 视图对应的控制器

- (UIView *)firstResponder; // 获取视图第一响应者

- (void)setCornerRadius:(CGFloat)cornerRadius;  // 设置cornerRadius

- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor;  // 设置border

- (void)setCornerRadius:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;  // 设置部分圆角

#pragma mark - 实用方法

- (void)addSubviewEx:(UIView *)view;    // 添加子视图并适配子视图大小
- (void)removeSubviewWithTag:(NSInteger)tag;    // 删除子视图
- (void)removeAllSubviews;  // 删除所有子视图

- (void)addBlurEffect; //添加毛玻璃效果
- (void)removeBlurEffect; //删除毛玻璃效果

- (void)addGradientColor:(UIColor*)fromColor toColor:(UIColor*)toColor; // 添加渐变色

- (UIImage*)capture;//截图

- (UIView*)viewWithXib:(NSString*)xibName;//用xib生成视图

+ (UIView*)addSubView:(UIView*)subView toSuperView:(UIView*)superView addedCallback:(LZAddedSubviewHandler)handler;


+ (UIViewController*)addSubViewWithController:(UIViewController*)childController
                                  toSuperView:(UIView*)superView
                                addedCallback:(LZAddedSubviewWithVCHandler)handler;

- (UIView*)addColorViewWithFrame:(CGRect)frame color:(UIColor*)color;

@end
