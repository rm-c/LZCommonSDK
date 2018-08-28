
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LZDrawStyleNormal,
    LZDrawStyleFill,
} LZDrawStyle;

@interface UIView (LZDraw)

// 画线
- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to color:(UIColor*)color with:(CGFloat)width;

// 画文本
- (void)drawText:(NSString*)text
         inFrame:(CGRect)frame
        aligment:(NSTextAlignment)aligment
           color:(UIColor*)color
            font:(UIFont*)font;
// 画矩形
- (void)drawRect:(CGRect)rect style:(LZDrawStyle)style color:(UIColor*)color lineWith:(CGFloat)lineWith;

// 画圆
- (void)drawCircle:(CGRect)rect style:(LZDrawStyle)style color:(UIColor*)color lineWith:(CGFloat)lineWith;

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
