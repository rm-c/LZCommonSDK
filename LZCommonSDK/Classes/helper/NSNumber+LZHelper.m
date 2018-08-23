//
//  NSNumber+LZHelper.m
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSNumber+LZHelper.h"

@implementation NSNumber (LZHelper)

- (NSString*)formatToStringWitStyle:(NSNumberFormatterStyle)formatStyle
{
    NSString *string = [NSNumberFormatter localizedStringFromNumber:self numberStyle:formatStyle];
    return string;
}

@end
