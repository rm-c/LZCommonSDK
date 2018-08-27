//
//  UIView+LZDraw.m
//  LZCommonSDK
//
//  Created by Macye on 2018/8/27.
//

#import "UIView+LZDraw.h"
#import "UIColor+LZHelper.h"

@implementation UIView (LZDraw)

- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to color:(UIColor*)color with:(CGFloat)width
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, width);
    CGContextSetRGBStrokeColor(context, color.red, color.green, color.blue, color.alpha);//线条颜色
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


@end
