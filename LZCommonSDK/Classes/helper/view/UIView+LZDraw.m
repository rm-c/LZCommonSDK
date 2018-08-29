//
//  UIView+LZDraw.m
//  LZCommonSDK
//
//  Created by Macye on 2018/8/27.
//

#import "UIView+LZDraw.h"
//#import "UIColor+LZHelper.h"

@implementation UIView (LZDraw)

- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to color:(UIColor*)color with:(CGFloat)width
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, width);
   // CGContextSetRGBStrokeColor(context, color.red, color.green, color.blue, color.alpha);//线条颜色
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)drawText:(NSString*)text inFrame:(CGRect)frame aligment:(NSTextAlignment)aligment color:(UIColor*)color font:(UIFont*)font
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.25);
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = aligment;
    [text drawInRect:frame withAttributes:@{NSFontAttributeName:font,
                                           NSForegroundColorAttributeName:color,
                                           NSParagraphStyleAttributeName: paragraphStyle}];
    CGContextSetLineWidth(context, 0.5);
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)drawRect:(CGRect)rect style:(LZDrawStyle)style color:(UIColor*)color lineWith:(CGFloat)lineWith
{
     CGContextRef context = UIGraphicsGetCurrentContext();
    // CGContextSetRGBFillColor(context, color.red, color.green, color.blue, color.alpha);
     if (style == LZDrawStyleNormal) {
         CGContextSetLineWidth(context, lineWith);
         CGContextAddRect(context, rect);
     }
     else{
         CGContextFillRect(context, rect);
     }
     CGContextStrokePath(context);
}

- (void)drawCircle:(CGRect)rect style:(LZDrawStyle)style color:(UIColor*)color lineWith:(CGFloat)lineWith
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextSetRGBStrokeColor(context, color.red, color.green, color.blue, color.alpha);
    if (style == LZDrawStyleNormal) {
        CGContextSetLineWidth(context, lineWith);
        CGContextAddEllipseInRect(context, rect);
    }
    else{
        CGContextFillEllipseInRect(context, rect);
    }
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)drawArc:(CGRect)rect
       location:(CGPoint)location
           form:(CGPoint)from
             to:(CGPoint)to
         radius:(CGFloat)radius
          style:(LZDrawStyle)style
          color:(UIColor*)color
       lineWith:(CGFloat)lineWith
{
     CGContextRef context = UIGraphicsGetCurrentContext();
     //CGContextSetRGBStrokeColor(context, color.red, color.green, color.blue, color.alpha);
     CGContextSetLineWidth(context, lineWith);
     CGContextSetStrokeColorWithColor(context, color.CGColor);
     CGContextMoveToPoint(context, location.x, location.y);
    CGContextAddArcToPoint(context, from.x, from.y, to.x, to.y, radius);
     if (style == LZDrawStyleNormal) {
         CGContextStrokePath(context);
     }
     else{
         CGContextFillPath(context);//实心的
     }
}

- (void)drawImage:(CGRect)frame image:(UIImage*)image
{
    [image drawInRect:frame];
}


@end
