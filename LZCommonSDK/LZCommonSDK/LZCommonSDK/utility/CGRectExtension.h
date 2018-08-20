//
//  CGRectExtension.h
//  GSUtilitiesSDK
//
//  Created by zhenwei on 14-3-17.
//  Copyright (c) 2014年 linzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CGRectExtension;

#define CGRectMake(x,y,width,height) [[CGRectExtension sharedInstance] cgRectMake:x and:y and:width and:height]

#define CGRectNormalize(rect) [[CGRectExtension sharedInstance] cgRectNormalize:rect]

@interface CGRectExtension : NSObject

/**
 * 单例
 */
+ (CGRectExtension *)sharedInstance;

- (CGRect)cgRectMake:(CGFloat)x and:(CGFloat)y and:(CGFloat)width and:(CGFloat)height;

- (CGRect)cgRectNormalize:(CGRect)rect;

@end
