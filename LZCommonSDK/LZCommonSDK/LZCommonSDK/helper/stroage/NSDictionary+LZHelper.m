//
//  NSDictionary+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSDictionary+LZHelper.h"

@implementation NSDictionary (LZHelper)

- (id)keyForIndex:(NSUInteger)index
{
    NSArray* keys = [self sortedKeys];
    NSString* key = keys[index];
    return key;
}

- (id)objectForKeyIndex:(NSUInteger)index
{
    NSArray* keys = [self sortedKeys];
    NSString* key = keys[index];
    return  [self objectForKey:key];
}

- (id)objectForIndexPath:(NSIndexPath*)indexPath
{
    NSArray* keys = [self sortedKeys];
    NSString* key = keys[indexPath.section];
    NSArray* arr = [self objectForKey:key];
    if ([arr isKindOfClass:[NSArray class]]) {
        return arr[indexPath.row];
    }
    return nil;
}

/**
 *  返回排线key数组
 *
 *  @return 排序后的数组
 */
- (NSArray*)sortedKeys
{
    return [[self allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (id)dekeyForIndex:(NSUInteger)index
{
    NSArray* keys = [self desortedKeys];
    NSString* key = keys[index];
    return key;
}

- (id)deobjectForKeyIndex:(NSUInteger)index
{
    NSArray* keys = [self desortedKeys];
    NSString* key = keys[index];
    return  [self objectForKey:key];
}

- (id)deobjectForIndexPath:(NSIndexPath*)indexPath
{
    NSArray* keys = [self desortedKeys];
    NSString* key = keys[indexPath.section];
    NSArray* arr = [self objectForKey:key];
    if ([arr isKindOfClass:[NSArray class]]) {
        return arr[indexPath.row];
    }
    return nil;
}


/**
 *  返回排线key数组
 *
 *  @return 反序数组
 */
- (NSArray*)desortedKeys
{
    return [[self allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2 compare:obj1];
    }];
}

- (NSIndexPath*)indexPathForObject:(id)object
{
    NSArray* keys = [self sortedKeys];
    for (int i = 0; i < keys.count; i++) {
        NSArray* sectionArr = [self objectForKey:keys[i]];
        
        for (int j = 0; j < sectionArr.count; j++) {
            id objTmp = sectionArr[j];
            if (objTmp == object) {
                return [NSIndexPath indexPathForRow:j inSection:i];
            }
        }
    }
    return nil;
}

@end
