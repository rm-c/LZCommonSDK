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
NSString* LZStringWithInteger(NSInteger value); // 整数字符串
NSString* LZStringWithFloat(CGFloat value);   // 浮点数字符串
UIFont* LZFontWithSize(CGFloat size);         // 系统字体
UIFont* LZBlodFontWithSize(CGFloat size);     // 系统粗体
NSURL* LZURLWithString(NSString *string);     // url
UIImage* LZImageNamed(NSString *name);        // 图片

NSString* s_int(NSInteger value);
NSString* s_float(CGFloat value);
UIFont *font(CGFloat size);

CGFloat LZDegreesToRadian(CGFloat degrees);   // 角度转弧度
CGFloat LZRadianToDegrees(CGFloat radian);    // 弧度转角度

NSMutableString* joinObjs(NSArray* objs);
NSMutableString* joinObjsEx(NSArray* objs, NSString* separator);

BOOL LZRespondsToSelector(id target, NSString* selectorName);

@end
