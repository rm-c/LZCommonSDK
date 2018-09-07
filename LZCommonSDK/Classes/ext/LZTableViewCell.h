//
//  BZTableViewCell.h
//  zhenwei
//
//  Created by mac on 2018/5/21.
//  Copyright © 2018年 zhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 仿UITableViewCell
 */
@interface LZTableViewCell : UIView

@property(nonatomic, strong)UILabel* textLabel;
@property(nonatomic, strong)UILabel* detailTextLabel;
@property(nonatomic, strong)UIImageView* imageView;
@property(nonatomic, strong)UIView* accessoryView;

- (instancetype)initWithFrame:(CGRect)frame;    // 需要调用下面的方法手动设置子视图位置

- (void)setImageFrame:(CGRect)imageFrame textFrame:(CGRect)textFrame;

- (void)setImageFrame:(CGRect)imageFrame
            textFrame:(CGRect)textFrame
      detailTextFrame:(CGRect)detailTextFrame
   accessoryViewFrame:(CGRect)accessoryViewFrame;

@end
