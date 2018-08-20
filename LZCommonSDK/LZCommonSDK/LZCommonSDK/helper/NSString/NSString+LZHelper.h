//
//  NSString+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LZHelper)

#pragma mark - 简便方法

+ (NSString*)stringWithInteger:(NSInteger)value;    // 声明数字字符串

#pragma mark - 相关判断
/**
 *  是否合法url
 *
 *  @param url url
 *
 *  @return 是否合法url, 不合法返回nil
 */
+ (NSString*)isValidateUrl:(NSString *)url;
- (BOOL)isValidateEmail;    // 是否合法邮件字符串
- (BOOL)isValidateMobile;   // 是否合法手机号格式

#pragma mark - 系统扩展
/**
 *  字符串大小
 *
 *  @param font 字体
 *
 *  @return 字符串大小
 */
- (CGSize)sizeWithFontEx:(UIFont *)font;

- (CGSize)sizeWithFontEx:(UIFont *)font maxSize:(CGSize)maxSize;

#pragma mark - 实用方法
/**
 *  获取字符串的实际长度，比如123的实际长度为3，123呵的实际长度为5
 *
 *  @return 实际长度
 */
- (int)realLength;

/**
 *  删除字符串头尾空格
 *
 *  @return 删除头尾空格后的字符串
 */
- (NSString*)stringByDeleteHeadAndTailWhitespace;

/**
 *  反序字符串
 *
 *  @return 反序字符串
 */
- (NSString*)reverseString;

@end
