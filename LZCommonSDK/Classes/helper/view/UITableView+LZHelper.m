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

- (CGFloat)sectionHeaderHeightForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView: heightForHeaderInSection:)]) {
        return [self.delegate tableView:self heightForHeaderInSection:section  ];
    }
    else{
        return self.sectionHeaderHeight;
    }
}

- (CGFloat)sectionFooterHeightForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView: heightForFooterInSection:)]) {
        return [self.delegate tableView:self heightForFooterInSection:section  ];
    }
    else{
        return self.sectionFooterHeight;
    }
}

@end
