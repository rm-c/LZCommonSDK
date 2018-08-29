
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
- (void)drawArcAtPosition:(CGPoint)position
               startAngle:(CGFloat)startAngle
                 endAngle:(CGFloat)endAngle
                   radius:(CGFloat)radius
                    style:(LZDrawStyle)style
                    color:(UIColor*)color
                 lineWith:(CGFloat)lineWith;

// 画图
- (void)drawImageInRect:(CGRect)rect image:(UIImage*)image;

@end
