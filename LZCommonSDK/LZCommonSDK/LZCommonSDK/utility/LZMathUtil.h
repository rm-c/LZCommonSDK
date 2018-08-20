//
//  GSMathUtil.h
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/19.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZMathUtil : NSObject

/**
 *  阿拉伯数字转换成中文数字
 *
 *  @param arebic 阿拉伯数字
 *
 *  @return 中文数字
 */
+ (NSString *)getChineseNumWithArebicNum:(NSUInteger)arebic;

+ (CGFloat)sum:(NSArray<NSNumber*>*)nums;   // 求和

+ (CGFloat)avg:(NSArray<NSNumber*>*)nums;   // 求平均值

+ (CGFloat)max:(NSArray<NSNumber*>*)nums;   // 最大数

+ (CGFloat)min:(NSArray<NSNumber*>*)nums;   // 最小数

@end
