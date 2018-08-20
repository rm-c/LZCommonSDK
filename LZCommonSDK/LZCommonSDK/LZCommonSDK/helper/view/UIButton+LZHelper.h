//
//  UIButton+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LZHelper)

#pragma mark - 初始化快捷方式

/**
 *  图片按钮
 *
 *  @param frame   位置
 *  @param bgImage 背景图
 *
 *  @return 图片按钮
 */
+ (UIButton*)buttonWithFrame:(CGRect)frame
                     bgImage:(UIImage*)bgImage;

/**
 *  图文按钮
 *
 *  @param frame      位置
 *  @param image      图片
 *  @param title      标题
 *  @param titleColor 标题颜色
 *  @param font       标题字体
 *
 *  @return 图文按钮
 */
+ (UIButton*)buttonWithFrame:(CGRect)frame
                       image:(UIImage*)image
                       title:(NSString*)title
                  titleColor:(UIColor*)titleColor
                        font:(UIFont*)font;

#pragma mark - 附加方法

/**
 *  设置标题
 *
 *  @param title      标题
 *  @param titleColor 标题颜色
 *  @param font       标题字体
 */
- (void)setTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font;


/**
 *  重新设置按钮图标和标题位置
 *
 *  @param imageFrame 图标位置, 传入CGRectNull表示不改变
 *  @param titieFrame 标题位置, 传入CGRectNull表示不改变
 */
- (void)setImageFrame:(CGRect)imageFrame titleFrame:(CGRect)titieFrame;

/**
 *  设置背景图片
 *
 *  @param url 背景图片url
 *  @param placeholderImage 默认图片
 */
- (void)setBackgroundImageWithURL:(NSString*)url placeholderImage:(UIImage*)placeholderImage;

@end
