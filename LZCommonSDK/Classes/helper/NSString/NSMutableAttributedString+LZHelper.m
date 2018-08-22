//
//  NSMutableAttributedString+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSMutableAttributedString+LZHelper.h"

@implementation NSMutableAttributedString (LZHelper)

- (void)addColorAttribute:(UIColor*)color range:(NSRange)range
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)addFontAttribute:(UIFont*)font range:(NSRange)range
{
    [self addAttribute:NSFontAttributeName value:font range:range];
}

- (void)addColorAttribute:(UIColor*)color fontAttribute:(UIFont*)font range:(NSRange)range
{
    [self addColorAttribute:color range:range];
    [self addFontAttribute:font range:range];
}

- (void)setLineSpacingAttribute:(CGFloat)spacing range:(NSRange)range
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}

- (void)setParagraphStyle:(NSMutableParagraphStyle*)paragraphStyle range:(NSRange)range
{
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}



@end
