//
//  LZTableSectionModel.h
//  BZZhangZhongFo
//
//  Created by maochao04 on 2018/1/5.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZTableSectionModel : NSObject

@property (nonatomic, strong) NSString *icon;         // 图标
@property (nonatomic, strong) NSString *headTitle;  // 头部标题
@property (nonatomic, strong) NSString *footTitle;  // 尾部标题
@property (nonatomic, assign) CGFloat headHeight;   ///不设置默认0
@property (nonatomic, assign) CGFloat footHeight;   ///不设置默认0
@property (nonatomic, strong) NSArray *items;       // 行模型数组

@end
