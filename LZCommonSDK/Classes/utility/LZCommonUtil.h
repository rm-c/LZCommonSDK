//
//  GSCommonUtil.h
//  GSCoreCommon
//
//  Created by zhenwei on 13-12-23.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZCommonUtil : NSObject

#pragma mark - 空值判断

+ (BOOL)isEmpty:(id)thing;  // 是否为空
+ (BOOL)isNotEmpty:(id)thing;   // 是否不为空

BOOL IsNotNilAndNull(id obj);   // 是否对象不是nil也不是null
BOOL IsNilOrNull(id obj);   // 是否对象是nil或者null

#pragma mark - 默认值设置

NSString* SetEmptyStringIfNil(NSString* string);    // 设置默认字符串为空
NSString* SetDefaultStringIfNil(NSString*string, NSString* defaultString);  // 设置默认字符串

#pragma mark - 简便方法
NSString* StringWithInteger(NSInteger value); // 整数字符串
NSString* StringWithFloat(CGFloat value);   // 浮点数字符串
UIFont* FontWithSize(CGFloat size);         // 系统字体
UIFont* BlodFontWithSize(CGFloat size);     // 系统粗体
NSURL* URLWithString(NSString *string);     // url
UIImage* imageNamed(NSString *name);        // 图片

CGFloat DegreesToRadian(CGFloat degrees);   // 角度转弧度
CGFloat RadianToDegrees(CGFloat radian);    // 弧度转角度

BOOL CanRespondsToSelector(id target, NSString* selectorName);

@end
