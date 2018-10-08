//
//  LZTableSectionModel.m
//  BZZhangZhongFo
//
//  Created by maochao04 on 2018/1/5.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LZTableSectionModel.h"

@implementation LZTableSectionModel

- (instancetype)init {
    if (self = [super init]) {
        self.rows = [NSMutableArray array];
        self.headHeight = 0.01;
        self.footHeight = 0.01;
    }
    return self;
}

-(void)setHeadTitle:(NSString *)headTitle
{
    _headTitle = [headTitle copy];
    if (headTitle) {
        _headHeight = 22.f;
    }else{
        _headHeight = 0.f;
    }
}

-(void)setFootTitle:(NSString *)footTitle
{
    _footTitle = footTitle;
    if (footTitle) {
        _footHeight = 22.f;
    }else{
        _footHeight = 0.f;
    }
}


+ (instancetype)itemWithIcon:(NSString *)icon
                   headTitle:(NSString *)headTitle
                   footTitle:(NSString *)footTitle
                  headHeight:(CGFloat)headHeight
                  footHeight:(CGFloat)footHeight
{
    LZTableSectionModel *item = [[self alloc] init];
    item.icon = icon;
    item.headTitle = headTitle;
    item.footTitle = footTitle;
    item.headHeight = headHeight;
    item.footHeight = footHeight;
    return item;
}

@end
