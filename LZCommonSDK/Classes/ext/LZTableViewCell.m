//
//  BZTableViewCell.m
//  zhenwei
//
//  Created by mac on 2018/5/21.
//  Copyright © 2018年 zhenwei. All rights reserved.
//

#import "LZTableViewCell.h"

@implementation LZTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super init]) {
        _detailTextLabel = [UILabel new];
        _textLabel = [UILabel new];
        _imageView = [UIImageView new];
        [self addSubview:_detailTextLabel];
        [self addSubview:_textLabel];
        [self addSubview:_imageView];
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if (_accessoryView) {
        [self addSubview:_accessoryView];
        [self setNeedsLayout];
    }
}

- (void)setImageFrame:(CGRect)imageFrame textFrame:(CGRect)textFrame
{
    [self setImageFrame:imageFrame textFrame:textFrame detailTextFrame:CGRectNull accessoryViewFrame:CGRectNull];
}

- (void)setImageFrame:(CGRect)imageFrame
            textFrame:(CGRect)textFrame
      detailTextFrame:(CGRect)detailTextFrame
   accessoryViewFrame:(CGRect)accessoryViewFrame
{
    if (CGRectIsNull(imageFrame) == NO) {
        self.imageView.frame = imageFrame;
    }
    
    if (CGRectIsNull(textFrame) == NO) {
        self.textLabel.frame = textFrame;
    }
    
    if (CGRectIsNull(detailTextFrame) == NO) {
        self.detailTextLabel.frame = detailTextFrame;
    }
    if (CGRectIsNull(accessoryViewFrame) == NO) {
        self.accessoryView.frame = accessoryViewFrame;
    }
}

@end
