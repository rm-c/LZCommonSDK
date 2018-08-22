//
//  UIEvent+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEvent (LZHelper)

/**
 *  获取触击事件在视图上的位置
 *
 *  @param view 触击视图
 *
 *  @return 触击事件在视图上的位置
 */
-(CGPoint)getTouchPointOnView:(UIView *)view;

@end
