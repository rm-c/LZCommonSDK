//
//  NSMutableAttributedString+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (LZHelper)

- (void)addColorAttribute:(UIColor*)color range:(NSRange)range;

- (void)addFontAttribute:(UIFont*)font range:(NSRange)range;

- (void)addColorAttribute:(UIColor*)color fontAttribute:(UIFont*)font range:(NSRange)range;

- (void)setLineSpacingAttribute:(CGFloat)spacing range:(NSRange)range;

- (void)setParagraphStyle:(NSMutableParagraphStyle*)paragraphStyle range:(NSRange)range;

@end
