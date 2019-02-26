//
//  UITableView+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (LZHelper)

/**
 *  清除tableView上默认的footView分割线
 */
- (void)hideTableViewFooterLine;

- (void)hideTableViewHeaderLine;

- (CGFloat)sectionHeaderHeightForSection:(NSInteger)section;        // 获取分区头部视图高度

- (CGFloat)sectionFooterHeightForSection:(NSInteger)section;        // 获取分区脚步视图高度

@end
