//
//  UIView+LZDraw.h
//  LZCommonSDK
//
//  Created by Macye on 2018/8/27.
//

#import <UIKit/UIKit.h>

@interface UIView (LZDraw)


/**
 画直线

 @param from 起点
 @param to 终点
 @param color 颜色
 @param width 线条宽度
 */
- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to color:(UIColor*)color with:(CGFloat)width;


/**
 画文本

 @param text 文本
 @param frame 位置
 @param aligment 对齐格式
 @param color 颜色
 @param font 字体
 */
- (void)drawText:(NSString*)text inFrame:(CGRect)frame aligment:(NSTextAlignment)aligment color:(UIColor*)color font:(UIFont*)font;

@end
