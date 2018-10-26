//
//  UILabel+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UILabel+LZHelper.h"
#import "NSMutableAttributedString+LZHelper.h"

@implementation UILabel (LZHelper)


+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString*)text textColor:(UIColor*)textColor font:(UIFont*)font
{
    UILabel* label = [[self alloc]initWithFrame:frame];
    label.text = text;
    if (textColor) {
        label.textColor = textColor;
    }
    if (font) {
        label.font = font;
    }
    label.backgroundColor = [UIColor clearColor];
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString*)text textAliment:(NSTextAlignment)aliment textColor:(UIColor*)textColor font:(UIFont*)font
{
    UILabel* label = [[self alloc]initWithFrame:frame];
    label.text = text;
    label.textAlignment = aliment;
    if (textColor) {
        label.textColor = textColor;
    }
    if (font) {
        label.font = font;
    }
    label.backgroundColor = [UIColor clearColor];
    return label;
}

- (void)setText:(NSString*)text textColor:(UIColor*)textColor font:(UIFont*)font
{
    [self setText:text textAliment:NSTextAlignmentLeft textColor:textColor font:font];
}

- (void)setText:(NSString*)text textAliment:(NSTextAlignment)aliment textColor:(UIColor*)textColor font:(UIFont*)font
{
    self.text = text;
    self.textAlignment = aliment;
    if (textColor) {
        self.textColor = textColor;
    }
    if (font) {
        self.font = font;
    }
}

- (void)setColorAttribute:(UIColor*)color range:(NSRange)range
{
    if (self.attributedText == nil) {
        self.attributedText = [NSMutableAttributedString attributedWithString:self.text];
    }
    NSMutableAttributedString* str = [self.attributedText mutableCopy];
    [str addColorAttribute:color range:range];
    self.attributedText = str;
}

- (void)setFontAttribute:(UIFont*)font range:(NSRange)range
{
    if (self.attributedText == nil) {
        self.attributedText = [NSMutableAttributedString attributedWithString:self.text];
    }
    NSMutableAttributedString* str = [self.attributedText mutableCopy];
    [str addFontAttribute:font range:range];
    self.attributedText = str;
}

- (CGRect)boundingRectForCharacterRange:(NSRange)range
{
    NSMutableAttributedString* str = self.attributedText;
    if (str == nil) {
        str = [[NSMutableAttributedString alloc] initWithString:self.text];
        [str addFontAttribute:self.font range:NSMakeRange(0, self.text.length)];
    }
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:str]];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:[self bounds].size];
    textContainer.lineFragmentPadding = 0;
    [layoutManager addTextContainer:textContainer];
    NSRange glyphRange;
    [layoutManager characterRangeForGlyphRange:range actualGlyphRange:&glyphRange];
    return [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
}

@end
