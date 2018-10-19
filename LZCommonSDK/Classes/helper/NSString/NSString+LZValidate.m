//
//  NSString+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSString+LZValidate.h"
#import "RegexKitLite.h"

@implementation NSString (LZValidate)


+ (NSString*)isUrlString:(NSString *)url
{
    NSString *urlRegEx =
    @"(http|ftp|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&amp;:/~\\+#]*[\\w\\-\\@?^=%&amp;/~\\+#])?";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    BOOL isVaild = [urlTest evaluateWithObject:url];
    if (!isVaild){
        if ([url hasPrefix:@"www"]){
            url = [NSString stringWithFormat:@"http://%@", url];
            isVaild = [urlTest evaluateWithObject:url];
        }
    }
    //通过正则判断 但无法打开，依旧判断为无效url
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]){
        isVaild = NO;
    }
    return isVaild ? url: nil;
}

- (BOOL)isChineseString
{
    for(int i = 0; i < [self length]; i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        } else{
            return NO;
        }
    }
    return NO;
}

- (BOOL)isNumberString
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^(\\d)$"] evaluateWithObject:self];
}

- (BOOL)isEmailString
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isMobileString
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)isIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)isPasswordStringWithMinLength:(int)minLength maxLength:(int)maxLength{
    NSString *pwdRegex = [NSString stringWithFormat:@"(^[0-9]{%d,%d}$)", minLength, maxLength] ;
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pwdRegex];
    return [pwdTest evaluateWithObject:self];
}

//判断是否为整形
- (BOOL)isIntegerString {
    if (!self) {
        return NO;
    }
    if (self.length < 1) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点型
- (BOOL)isFloatString {
    if (!self) {
        return NO;
    }
    if (self.length < 1) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (NSArray*)extractNumbers
{
    NSArray* matches = [self componentsMatchedByRegex:@"\\b([0-9]+)\\b"];
    return matches;
}

@end
