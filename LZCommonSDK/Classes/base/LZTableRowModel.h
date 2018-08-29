//
//  BZSettingItem.h
//  BZZhangZhongFo
//
//  Created by maochao04 on 2018/1/5.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZBaseModel.h"

@class LZTableRowModel;

typedef void (^LZTableRowOperationBlock)(LZTableRowModel *item);

@interface LZTableRowModel : LZBaseModel

@property (nonatomic, copy) NSString *icon;         // 图标
@property (nonatomic, copy) NSString *title;        // 标题
@property (nonatomic, copy) NSString *subtitle;     // 子标题
@property (nonatomic, assign) CGFloat cellHeight;   // 高度
@property (nonatomic, assign) UIViewController* detailVC;         // 目标控制器
@property (nonatomic, copy) LZTableRowOperationBlock operation;// 点击那个cell需要做什么事情

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;

+ (instancetype)itemWithIcon:(NSString *)icon
                       title:(NSString *)title
                    subtitle:(NSString *)subtitle
                    detailVC:(UIViewController*)detailVC
                   operation:(LZTableRowOperationBlock)operation;

@end
