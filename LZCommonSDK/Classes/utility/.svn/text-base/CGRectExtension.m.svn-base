//
//  CGRectExtension.m
//  GSUtilitiesSDK
//
//  Created by zhenwei on 14-3-17.
//  Copyright (c) 2014年 linzhenwei. All rights reserved.
//

#import "CGRectExtension.h"

@implementation CGRectExtension

+ (CGRectExtension*)sharedInstance
{
    static dispatch_once_t pred;
    static CGRectExtension *sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (CGRect)cgRectMake:(CGFloat)x and:(CGFloat)y and:(CGFloat)width and:(CGFloat)height
{
    CGRect rect;
    rect.origin.x = x;
    rect.origin.y = y;
    rect.size.width = width;
    rect.size.height = height;
    
    rect = [[CGRectExtension sharedInstance] cgRectNormalize:rect];
    
    return rect;
}

- (CGRect)cgRectNormalize:(CGRect)rect
{
    CGRect newRect;
	newRect.origin.x = ceilf(rect.origin.x);
	newRect.origin.y = ceilf(rect.origin.y);
	newRect.size.width = ceilf(rect.size.width);
	newRect.size.height = ceilf(rect.size.height);
	return newRect;
}

@end
