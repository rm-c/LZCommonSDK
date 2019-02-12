//
//  UITextField+LZHelper.m
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UITextField+LZHelper.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation UITextField (LZHelper)

+ (UITextField*)textFieldWithFrame:(CGRect)frame
                              text:(NSString*)text
                         textColor:(UIColor*)textColor
                              font:(UIFont*)font
                       placeholder:(NSString*)placeholder
{
    UITextField* textField = [[UITextField alloc]initWithFrame:frame];
    textField.text = text;
    if (textColor) {
        textField.textColor = textColor;
    }
    if (font) {
        textField.font = font;
    }
    textField.placeholder = placeholder;
    textField.backgroundColor = [UIColor clearColor];
    return textField;
}

+ (UITextField*)textFieldWithFrame:(CGRect)frame
                              text:(NSString*)text
                       textAliment:(NSTextAlignment)aliment
                         textColor:(UIColor*)textColor
                              font:(UIFont*)font
                       placeholder:(NSString*)placeholder
{
    UITextField* textField = [[UITextField alloc]initWithFrame:frame];
    textField.text = text;
    textField.textAlignment = aliment;
    if (textColor) {
        textField.textColor = textColor;
    }
    if (font) {
        textField.font = font;
    }
    textField.placeholder = placeholder;
    textField.backgroundColor = [UIColor clearColor];
    return textField;
}

- (void)setText:(NSString*)text
      textColor:(UIColor*)textColor
           font:(UIFont*)font
    placeholder:(NSString*)placeholder
{
    self.text = text;
    if (textColor) {
        self.textColor = textColor;
    }
    if (font) {
        self.font = font;
    }
    self.placeholder = placeholder;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setText:(NSString*)text
    textAliment:(NSTextAlignment)aliment
      textColor:(UIColor*)textColor
           font:(UIFont*)font
    placeholder:(NSString*)placeholder
{
    self.textAlignment = aliment;
    [self setText:text textColor:textColor font:font placeholder:placeholder];
}

- (void)setPlaceholderColor:(UIColor*)color
{
    if (color) {
        [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (void)setPlaceholderFont:(UIFont*)font
{
    if (font) {
        [self setValue:font forKeyPath:@"_placeholderLabel.font"];
    }
}

#pragma mark - set maxLength

static const char *LZTextFieldInputLimitMaxLength;

- (NSInteger)maxLength
{
    return [objc_getAssociatedObject(self, LZTextFieldInputLimitMaxLength) integerValue];
}

- (void)setMaxLength:(NSInteger)maxLength
{
    objc_setAssociatedObject(self, LZTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(lzTextFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)lzTextFieldTextDidChange
{
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.maxLength > 0 && toBeString.length > self.maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}

@end
