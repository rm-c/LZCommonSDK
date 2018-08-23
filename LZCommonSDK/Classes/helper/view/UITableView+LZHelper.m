//
//  UITableView+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UITableView+LZHelper.h"

@implementation UITableView (LZHelper)

/**
 *  清除tableView上默认的footView分割线
 */
- (void)hideTableViewFooterLine
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

@end
