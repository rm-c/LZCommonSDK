//
//  UIImageView+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LZHelper)

/**
 *  图片视图声明
 *
 *  @param frame 位置
 *  @param image 图片
 *
 *  @return 图片视图
 */
+ (UIImageView*)imageViewWithFrame:(CGRect)frame image:(UIImage*)image;

/**
 *  图片视图声明
 *
 *  @param image    图片
 *  @param position 位置
 *
 *  @return 图片视图
 */
+ (UIImageView*)imageViewWithImage:(UIImage*)image originPosition:(CGPoint)position;

@end
