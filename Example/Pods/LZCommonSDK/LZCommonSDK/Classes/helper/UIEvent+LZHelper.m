//
//  UIEvent+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIEvent+LZHelper.h"

@implementation UIEvent (LZHelper)

- (CGPoint)getTouchPointOnView:(UIView *)view
{
    NSSet *allTouches = [self allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint point = [touch locationInView:view];
    return point;
}

@end
