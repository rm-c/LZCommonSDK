//
//  UIView+GSGusture.m
//  MMC_BabyLearn
//
//  Created by maochao04 on 2017/3/9.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIView+GSGusture.h"
#import <objc/runtime.h>

const char tapGestureHandlerKey;
const char longPressGestureHandlerKey;
const char swipeGestureHandlerKey;
const char panGestureHandlerKey;

@implementation UIView (GSGusture)

#pragma mark - 点击手势

- (UITapGestureRecognizer*)addTapGestureWithTarget:(id)target number:(NSInteger)number  selector:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:selector];
    tapGesture.numberOfTapsRequired = number;
    [self addGestureRecognizer:tapGesture];
    return tapGesture;
}

- (UITapGestureRecognizer*)addTapGestureWithNumber:(NSInteger)number handler:(GSViewGestureEventHandler)handler
{
    objc_setAssociatedObject(self, &tapGestureHandlerKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return [self addTapGestureWithTarget:self number:number selector:@selector(tapEvent:)];
}

- (void)tapEvent:(id)sender
{
    GSViewGestureEventHandler handler = objc_getAssociatedObject(self, &tapGestureHandlerKey);
    if (handler) {
        handler(self, sender);
    }
}

#pragma mark - 长按手势

- (UILongPressGestureRecognizer*)addLongPressGestureWithTarget:(id)target selector:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:selector];
    longPressGestureRecognizer.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:longPressGestureRecognizer];
    return longPressGestureRecognizer;
}

- (UILongPressGestureRecognizer*)addLongPressGestureWithHandler:(GSViewGestureEventHandler)handler
{
    objc_setAssociatedObject(self, &longPressGestureHandlerKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return [self addLongPressGestureWithTarget:self selector:@selector(longPressEvent:)];
}

- (void)longPressEvent:(id)sender
{
    GSViewGestureEventHandler handler = objc_getAssociatedObject(self, &longPressGestureHandlerKey);
    if (handler) {
        handler(self, sender);
    }
}

#pragma mark - 轻扫手势

- (UISwipeGestureRecognizer*)addSwipeGestureWithTarget:(id)target direction:(UISwipeGestureRecognizerDirection)direction selector:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:target action:selector];
    [swipeGesture setDirection:(direction)];
    [self addGestureRecognizer:swipeGesture];
    return swipeGesture;
}

- (UISwipeGestureRecognizer*)addSwipeGestureWithDirection:(UISwipeGestureRecognizerDirection)direction handler:(GSViewGestureEventHandler)handler
{
    objc_setAssociatedObject(self, &swipeGestureHandlerKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return [self addSwipeGestureWithTarget:self direction:direction selector:@selector(swipeEvent:)];
}

- (void)swipeEvent:(id)sender
{
    GSViewGestureEventHandler handler = objc_getAssociatedObject(self, &swipeGestureHandlerKey);
    if (handler) {
        handler(self, sender);
    }
}

#pragma mark - 扫动手势

- (UIPanGestureRecognizer*)addPanGestureWithTarget:(id)target direction:(UISwipeGestureRecognizerDirection)direction selector:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGusture = [[UIPanGestureRecognizer alloc]initWithTarget:target action:selector];
    [self addGestureRecognizer:panGusture];
    return panGusture;
}

- (UIPanGestureRecognizer*)addPanGestureWithDirection:(UISwipeGestureRecognizerDirection)direction handler:(GSViewGestureEventHandler)handler
{
    objc_setAssociatedObject(self, &panGestureHandlerKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return [self addPanGestureWithTarget:self direction:direction selector:@selector(panEvent:)];
}

- (void)panEvent:(id)sender
{
    GSViewGestureEventHandler handler = objc_getAssociatedObject(self, &panGestureHandlerKey);
    if (handler) {
        handler(self, sender);
    }
}


@end
