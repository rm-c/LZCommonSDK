//
//  LZTableSectionModel.h
//  BZZhangZhongFo
//
//  Created by maochao04 on 2018/1/5.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZBaseModel.h"

@interface LZTableSectionModel : LZBaseModel

@property (nonatomic, strong) NSString *icon;       // 图标
@property (nonatomic, strong) NSString *headTitle;  // 头部标题
@property (nonatomic, strong) NSString *footTitle;  // 尾部标题
@property (nonatomic, assign) CGFloat headHeight;   ///不设置默认0
@property (nonatomic, assign) CGFloat footHeight;   ///不设置默认0
@property (nonatomic, strong) NSMutableArray *rows;       // 行模型数组
@property (nonatomic, assign) BOOL expend;          // 是否展开

+ (instancetype)itemWithIcon:(NSString *)icon
                   headTitle:(NSString *)headTitle
                   footTitle:(NSString *)footTitle
                  headHeight:(CGFloat)headHeight
                  footHeight:(CGFloat)footHeight;

@end
