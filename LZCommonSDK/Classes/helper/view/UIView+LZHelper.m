//
//  UIView+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/22.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIView+LZHelper.h"

@implementation UIView (LZHelper)

- (UIViewController *)viewController
{
    id nextResponder = [self nextResponder];
    if (nextResponder)
    {
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return nextResponder;
        } else
        {
            return [self.superview viewController];
        }
    }else
    {
        return nil;
    }
}

- (UIView *)firstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView firstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}

#pragma mark - 便捷方法

- (void)addSubviewEx:(UIView *)view
{
    [self addSubview:view];
    
    CGRect frame = self.frame;
    if (frame.size.width < view.frame.origin.x + view.frame.size.width) {
        frame.size.width = view.frame.origin.x + view.frame.size.width;
    }
    
    if (frame.size.height < view.frame.origin.y + view.frame.size.height) {
        frame.size.height = view.frame.origin.y + view.frame.size.height;
    }
    
    self.frame = frame;
}

- (void)removeSubviewWithTag:(NSInteger)tag
{
    UIView* subView = [self viewWithTag:tag];
    if (subView) {
        [subView removeFromSuperview];
    }
}

- (void)removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)addBlurEffect
{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:effectview];
}

- (void)removeBlurEffect
{
    for (UIView* subView in self.subviews) {
        if ([subView isKindOfClass:[UIVisualEffectView class]]) {
            [subView removeFromSuperview];
        }
    }
}

- (void)addGradientColor:(UIColor*)fromColor toColor:(UIColor*)toColor
{
    UIView *colorView = [[UIView alloc] initWithFrame:self.bounds];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = colorView.bounds;
    gradient.colors = [NSArray arrayWithObjects:fromColor.CGColor, toColor.CGColor, nil];
    [colorView.layer addSublayer:gradient];
    [self insertSubview:colorView atIndex:0];
}

- (UIImage*)capture
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  设置cornerRadius
 *
 *  @param cornerRadius cornerRadius
 */
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setCornerRadius:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                      byRoundingCorners:corners
                                                            cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = bezierPath.CGPath;
    self.layer.mask = maskLayer;
}


/**
 *  设置border
 *
 *  @param borderWidth boder宽度
 *  @param borderColor border高度
 */
- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor
{
    self.layer.borderWidth = borderWidth;
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
}

+ (UIView*)addSubView:(UIView*)subView toSuperView:(UIView*)superView addedCallback:(LZAddedSubviewHandler)handler
{
    [superView addSubview:subView];
    if (handler) {
        handler(subView, superView);
    }
    return subView;
}

+ (UIViewController*)addSubViewWithController:(UIViewController*)childController
                                  toSuperView:(UIView*)superView
                                addedCallback:(LZAddedSubviewWithVCHandler)handler
{
    [superView addSubview:childController.view];
    if (handler) {
        handler(childController, superView);
    }
    return childController;
}

- (UIView*)viewWithXib:(NSString*)xibName
{
    UIView* view = [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil].lastObject;
    return view;
}

- (UIView*)addColorViewWithFrame:(CGRect)frame color:(UIColor*)color
{
    UIView* line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    [self addSubview:line];
    return line;
}

@end
