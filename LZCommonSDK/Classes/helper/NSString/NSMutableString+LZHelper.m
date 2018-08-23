//
//  NSMutableString+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSMutableString+LZHelper.h"

@implementation NSMutableString (LZHelper)

/**
 *  用逗号隔开
 *
 *  @param string 拼接字符串
 */
- (void) appendStringSeparatedByComma:(NSString*)string
{
    if (string.length <= 0) {
        return;
    }
    
    if (self.length > 0) {
        [self appendString:@","];
    }
    
    [self appendString:string];
}



@end
