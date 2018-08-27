//
//  UIView+LZDraw.h
//  LZCommonSDK
//
//  Created by Macye on 2018/8/27.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LZDrawStyleNormal,
    LZDrawStyleFill,
} LZDrawStyle;

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
- (void)drawText:(NSString*)text
         inFrame:(CGRect)frame
            with:(CGFloat)width
        aligment:(NSTextAlignment)aligment
           color:(UIColor*)color
            font:(UIFont*)font;


/**
 画矩形

 @param rect 位置
 @param style 风格
 @param color 颜色
 @param lineWith 线条宽度(仅对LZDrawStyleNormal模式有效)
 */
- (void)drawRect:(CGRect)rect
           style:(LZDrawStyle)style
           color:(UIColor*)color
        lineWith:(CGFloat)lineWith;

// 画圆
- (void)drawCircle:(CGRect)rect
             style:(LZDrawStyle)style
             color:(UIColor*)color
          lineWith:(CGFloat)lineWith;

// 画弧
- (void)drawArc:(CGRect)rect
       location:(CGPoint)location
           form:(CGPoint)from
             to:(CGPoint)to
         radius:(CGFloat)radius
          style:(LZDrawStyle)style
          color:(UIColor*)color
       lineWith:(CGFloat)lineWith;

// 画图
- (void)drawImage:(CGRect)frame image:(UIImage*)image;

@end
