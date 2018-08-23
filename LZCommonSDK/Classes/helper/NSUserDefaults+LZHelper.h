//
//  NSUserDefaults+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (LZHelper)

+ (void)setValue:(id)value forKey:(NSString *)key;

+ (id)valueForKey:(NSString *)key;

+ (void)setInteger:(NSInteger)value forKey:(NSString *)key;

+ (NSInteger)integerForKey:(NSString *)key;

- (void)removeAllDefaults;

@end
