//
//  BZSettingItem.m
//  BZZhangZhongFo
//
//  Created by maochao04 on 2018/1/5.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LZTableRowModel.h"

@implementation LZTableRowModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 44.0f;
    }
    return self;
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    LZTableRowModel *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithIcon:(NSString *)icon
                       title:(NSString *)title
                    subtitle:(NSString *)subtitle
                    detailVC:(UIViewController*)detailVC
                   operation:(LZTableRowOperationBlock)operation
{
    LZTableRowModel *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.subtitle = subtitle;
    item.detailVC = detailVC;
    item.operation = operation;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}

@end
