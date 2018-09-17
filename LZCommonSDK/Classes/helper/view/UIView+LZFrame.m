//
//  UIView+LZFrame.m
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/12.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIView+LZFrame.h"

@implementation UIView (LZFrame)


- (CGFloat)x1
{
    return self.frame.origin.x;
}

- (CGFloat)x2
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)y1
{
    return self.frame.origin.y;
}

- (CGFloat)y2
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setX1:(CGFloat)x1
{
    CGRect frame = self.frame;
    frame.origin.x = x1;
    self.frame = frame;
}

- (void)setY1:(CGFloat)y1
{
    CGRect frame = self.frame;
    frame.origin.y = y1;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


- (void)moveBy: (CGPoint)delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}


- (void)scaleBy: (CGFloat)scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}


- (void)fitInSize: (CGSize)aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;	
}

@end
