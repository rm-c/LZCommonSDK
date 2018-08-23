//
//  UITextField+LZHelper.h
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LZHelper)

+ (UITextField*)textFieldWithFrame:(CGRect)frame
                              text:(NSString*)text
                         textColor:(UIColor*)textColor
                              font:(UIFont*)font
                       placeholder:(NSString*)placeholder;

+ (UITextField*)textFieldWithFrame:(CGRect)frame
                              text:(NSString*)text
                       textAliment:(NSTextAlignment)aliment
                         textColor:(UIColor*)textColor
                              font:(UIFont*)font
                       placeholder:(NSString*)placeholder;

/**
 *  设置占位符颜色
 *
 *  @param color 占位符颜色
 */
- (void)setPlaceholderColor:(UIColor*)color;

/**
 *  设置占位符字体
 *
 *  @param font 占位符字体
 */
- (void)setPlaceholderFont:(UIFont*)font;

/**
 *  设置最大长度
 *
 *  @param maxLength 设置最大长度
 */
- (void)setMaxLength:(NSInteger)maxLength;

@end
