//
//  NSString+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSString+LZHelper.h"
#import "RegexKitLite.h"

@implementation NSString (LZHelper)

+ (NSString*)stringWithInteger:(NSInteger)value
{
    return [NSString stringWithFormat:@"%ld", (long)value];
}

- (int)realLength
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [self dataUsingEncoding:enc];
    return (int)[da length];
}

+ (NSString*)isValidateUrl:(NSString *)url
{
    NSString *urlRegEx =
    @"(http|ftp|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&amp;:/~\\+#]*[\\w\\-\\@?^=%&amp;/~\\+#])?";
    
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    BOOL isVaild = [urlTest evaluateWithObject:url];
    
    if (!isVaild)
    {
        if ([url hasPrefix:@"www"])
        {
            url = [NSString stringWithFormat:@"http://%@", url];
            isVaild = [urlTest evaluateWithObject:url];
        }
    }
    
    //通过正则判断 但无法打开，依旧判断为无效url
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]])
    {
        isVaild = NO;
    }
    
    return isVaild ? url: nil;
}

- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidateMobile
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (CGSize)sizeWithFontEx:(UIFont *)font
{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize retSize = [self sizeWithAttributes:attributes];
    return retSize;
}


- (CGSize)sizeWithFontEx:(UIFont *)font maxSize:(CGSize)maxSize
{
    //返回字符串所占用的尺寸.
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (NSString*)stringByDeleteHeadAndTailWhitespace
{
    return [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


- (NSArray*)extractNumbers
{
    NSArray* matches = [self componentsMatchedByRegex:@"\\b([0-9]+)\\b"];
    return matches;
}

- (NSString*)reverseString
{
    NSMutableString *reverString = [NSMutableString stringWithCapacity:self.length];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                            options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences
                         usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reverString appendString:substring];
    }];
    return reverString;
}

@end
