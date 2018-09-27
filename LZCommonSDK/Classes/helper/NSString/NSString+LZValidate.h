//
//  NSString+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LZValidate)

+ (NSString*)isUrlString:(NSString *)url;   // 是否合法url, 合法返回完整url, 不合法返回nil

- (BOOL)isEmailString;      // 是否合法邮件字符串
- (BOOL)isMobileString;     // 是否合法手机号格式
- (BOOL)isNumberString;     // 是否数字字符串
- (BOOL)isIntegerString;    // 判断是否为整形
- (BOOL)isFloatString;      //判断是否为浮点型

/**
 是否合格密码

 @param minLength 最小长度
 @param maxLength 最大长度
 @return 是否合格
 */
- (BOOL)isPasswordStringWithMinLength:(int)minLength maxLength:(int)maxLength;

@end
