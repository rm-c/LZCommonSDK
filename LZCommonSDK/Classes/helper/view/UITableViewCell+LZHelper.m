//
//  UITableViewCell+LZHelper.m
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/29.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UITableViewCell+LZHelper.h"

@implementation UITableViewCell (LZHelper)

- (void)setImageFrame:(CGRect)imageFrame textFrame:(CGRect)textFrame
{
    [self setImageFrame:imageFrame textFrame:textFrame detailTextFrame:CGRectNull accessoryViewFrame:CGRectNull];
}

- (void)setImageFrame:(CGRect)imageFrame
            textFrame:(CGRect)textFrame
      detailTextFrame:(CGRect)detailTextFrame
   accessoryViewFrame:(CGRect)accessoryViewFrame
{
    [self aspect_hookSelector:@selector(layoutSubviews) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info){
        UITableViewCell* instance = info.instance;
        if (CGRectIsNull(imageFrame) == NO) {
            instance.imageView.frame = imageFrame;
        }
        
        if (CGRectIsNull(textFrame) == NO) {
            instance.textLabel.frame = textFrame;
        }
        
        if (CGRectIsNull(detailTextFrame) == NO) {
            instance.detailTextLabel.frame = detailTextFrame;
        }
        if (CGRectIsNull(accessoryViewFrame) == NO) {
            instance.accessoryView.frame = accessoryViewFrame;
        }
        
    } error:nil];
}

@end
