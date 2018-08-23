//
//  UIView+GSGusture.h
//  MMC_BabyLearn
//
//  Created by maochao04 on 2017/3/9.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UISwipeGestureRecognizerDirectionAll        (UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown)
#define UISwipeGestureRecognizerDirectionHorizontal (UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight)
#define UISwipeGestureRecognizerDirectionVertical   (UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown)

typedef void(^GSViewGestureEventHandler)(UIView* view, id gestureRecognize);

@interface UIView (GSGusture)

#pragma mark - 手势相关

/**
 *  添加单击手势
 *
 *  @param target   手势响应target
 *  @param number   单击次数
 *  @param selector 响应方法
 *
 *  @return 手势
 */
- (UITapGestureRecognizer*)addTapGestureWithTarget:(id)target number:(NSInteger)number  selector:(SEL)selector;

- (UITapGestureRecognizer*)addTapGestureWithNumber:(NSInteger)number handler:(GSViewGestureEventHandler)handler;

/**
 *  添加长按手势
 *
 *  @param target   手势响应target
 *  @param selector 响应方法
 *
 *  @return 手势
 */
- (UILongPressGestureRecognizer*)addLongPressGestureWithTarget:(id)target selector:(SEL)selector;

- (UILongPressGestureRecognizer*)addLongPressGestureWithHandler:(GSViewGestureEventHandler)handler;

/**
 *  添加轻扫手势
 *
 *  @param target    手势响应target
 *  @param direction 轻扫方向
 *  @param selector  响应方法
 *
 *  @return 手势
 */
- (UISwipeGestureRecognizer*)addSwipeGestureWithTarget:(id)target direction:(UISwipeGestureRecognizerDirection)direction selector:(SEL)selector;

- (UISwipeGestureRecognizer*)addSwipeGestureWithDirection:(UISwipeGestureRecognizerDirection)direction handler:(GSViewGestureEventHandler)handler;

/**
 *  添加滑动手势
 *
 *  @param target    手势响应target
 *  @param direction 滑动方向
 *  @param selector  响应方法
 *
 *  @return 手势
 */
- (UIPanGestureRecognizer*)addPanGestureWithTarget:(id)target direction:(UISwipeGestureRecognizerDirection)direction selector:(SEL)selector;

- (UIPanGestureRecognizer*)addPanGestureWithDirection:(UISwipeGestureRecognizerDirection)direction handler:(GSViewGestureEventHandler)handler;

@end
