//
//  NSString+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LZValidate)

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
- (BOOL)isValidateNum;        // 是否数字字符串
- (BOOL)isIntegerString;      // 判断是否为整形
- (BOOL)isFloatString;      //判断是否为浮点型

/**
 是否合格密码

 @param min 最小长度
 @param max 最大长度
 @return 是否合格
 */
- (BOOL)isValidatePasswordWithRangeMin:(int)min rangeMax:(int)max;

@end
