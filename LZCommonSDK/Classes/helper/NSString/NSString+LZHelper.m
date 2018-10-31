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

- (NSString*)reverseString{
    NSMutableString *reverString = [NSMutableString stringWithCapacity:self.length];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                            options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences
                         usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reverString appendString:substring];
    }];
    return reverString;
}

+ (NSMutableString*)stringByJoinObjects:(NSArray*)objs separator:(NSString*)separator
{
    NSMutableString* s = [NSMutableString string];
    [objs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (s.length > 0) {
            [s appendString:separator];
        }
        [s appendString:[NSString stringWithFormat:@"%@", obj]];
    }];
    return s;
}

@end
