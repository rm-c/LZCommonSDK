//
//  UIImageView+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIImageView+LZHelper.h"

@implementation UIImageView (LZHelper)

+ (UIImageView*)imageViewWithFrame:(CGRect)frame image:(UIImage*)image
{
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = image;
    return imageView;
}

+ (UIImageView*)imageViewWithImage:(UIImage*)image originPosition:(CGPoint)position
{
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(position.x, position.y, image.size.width, image.size.height)];
    imageView.image = image;
    return imageView;
}

@end
