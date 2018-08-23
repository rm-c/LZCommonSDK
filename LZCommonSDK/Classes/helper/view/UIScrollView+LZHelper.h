//
//  UIScrollView+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (LZHelper)

#pragma mark - page
/**
 *  初始化滑动翻页视图
 *
 *  @param frame 位置
 *  @param pageCount 页数
 *
 *  @return 自身
 */
-(id)initPageScrollViewWithFrame:(CGRect)frame pageCount:(NSInteger)pageCount;

/**
 *  滑动到页面
 *
 *  @param pageIndex 页面索引
 *  @param animated  是否支持动画
 */
- (void)scrollToPage:(NSInteger)pageIndex animated:(BOOL)animated;

- (NSInteger)pageCount; // 页数

/**
 *  获取当前页(0...n)
 *
 *  @return 当前页
 */
- (NSInteger)currentPageIndex;

#pragma mark - short cut

- (CGPoint)topContentOffset;

- (CGPoint)bottomContentOffset;

- (CGPoint)leftContentOffset;

- (CGPoint)rightContentOffset;

#pragma mark - util

/**
 *  添加子视图并自动调整滑动视图contentSize以适应
 *
 *  @param view 子视图
 */
- (void)addSubviewEx:(UIView *)view;

@end
