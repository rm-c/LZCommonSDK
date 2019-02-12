//
//  UIButton+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIButton+LZHelper.h"
#import "Aspects.h"

@implementation UIButton (LZHelper)

#pragma mark - 初始化快捷方式

+ (UIButton*)buttonWithFrame:(CGRect)frame
                     bgImage:(UIImage*)bgImage
{
    UIButton* button = [[UIButton alloc]initWithFrame:frame];
    [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    return button;
}

+ (UIButton*)buttonWithFrame:(CGRect)frame
                       image:(UIImage*)image
                       title:(NSString*)title
                  titleColor:(UIColor*)titleColor
                        font:(UIFont*)font
{
    UIButton* button = [[UIButton alloc]initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    
    return button;
}

#pragma mark - 附加方法


/**
 *  设置标题
 *
 *  @param title      标题
 *  @param titleColor 标题颜色
 *  @param font       标题字体
 */
- (void)setTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font
{
    if (title) {
        [self setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        self.titleLabel.font = font;
    }
}

- (void)setImage:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font
{
    if (image) {
        [self setImage:image forState:UIControlStateNormal];
    }
    [self setTitle:title titleColor:titleColor font:font];
}

- (void)setBgImage:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font
{
    if (image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    [self setTitle:title titleColor:titleColor font:font];
}

- (void)setImageFrame:(CGRect)imageFrame titleFrame:(CGRect)titieFrame
{
    [self aspect_hookSelector:@selector(layoutSubviews) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info){
        UIButton* instance = info.instance;
        if (CGRectIsNull(imageFrame) == NO) {
            instance.imageView.frame = imageFrame;
        }
        
        if (CGRectIsNull(titieFrame) == NO) {
            instance.titleLabel.frame = titieFrame;
        }
        
    } error:nil];
}

@end
