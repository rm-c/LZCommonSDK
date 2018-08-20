//
//  NSArray+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSArray+LZHelper.h"

@implementation NSArray (LZHelper)

- (NSArray*)sortedArrayUsingKeyString:(NSString *)keyString isAscending:(BOOL)isAscending
{
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:keyString ascending:isAscending];
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

- (id)prevByLoop:(NSInteger*)currentIndex
{
    if (--(*currentIndex) < 0) {
        *currentIndex = self.count - 1;
    }
    return [self objectAtIndex:*currentIndex];
}

- (id)nextByLoop:(NSInteger*)currentIndex
{
    if (++(*currentIndex) > self.count - 1) {
        *currentIndex = 0;
    }
    return [self objectAtIndex:*currentIndex];
}

- (id)prevNoLoop:(NSInteger*)currentIndex
{
    if (--(*currentIndex) < 0) {
        *currentIndex = 0;
    }
    return [self objectAtIndex:*currentIndex];
}

- (id)nextNoLoop:(NSInteger*)currentIndex
{
    if (++(*currentIndex) > self.count - 1) {
        *currentIndex = self.count - 1;
    }
    return [self objectAtIndex:*currentIndex];
}

- (id)objectAtReverseIndex:(NSUInteger)index
{
    if (self.count >= index + 1) {
        return self[self.count - (index + 1)];
    }
    return nil;
}

- (NSArray*)reverseArray
{
    return  [[self reverseObjectEnumerator] allObjects];
}

- (NSArray*)randomSorted
{
    NSMutableArray* array = [self mutableCopy];
    for (int i = 0; i < array.count; ++i) {
        int n = (arc4random() % array.count - i) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return array;
}

@end
