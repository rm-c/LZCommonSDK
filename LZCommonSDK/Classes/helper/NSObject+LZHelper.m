//
//  NSObject+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSObject+LZHelper.h"

const char performEventHandlerKey;

@implementation NSObject (LZHelper)

#pragma mark - 事件处理

- (void)performEventHandler:(GSPerformEventHandler)handler param:(id)param afterDelay:(NSTimeInterval)delay
{
    if (handler == nil) {
        return;
    }
    
    objc_setAssociatedObject(self, &performEventHandlerKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self performSelector:@selector(doPerform:) withObject:param afterDelay:delay];
}

- (void)doPerform:(id)param
{
    GSPerformEventHandler handler = objc_getAssociatedObject(self, &performEventHandlerKey);
    if (handler) {
        handler(self, param);
    }
}

+ (void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (block1) {
            block1();
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if (block2) {
                block2();
            }
        });
    });
}

- (void)perform:(void(^)())block1 withCompletionHandler:(void (^)())block2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (block1) {
            block1();
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if (block2) {
                block2();
            }
        });
    });
}

- (void)setAssociatedObject:(id)value forKey:(const NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void *)(key), value, OBJC_ASSOCIATION_RETAIN);
}

- (id)getAssociatedObjectForKey:(const NSString *)key
{
    return objc_getAssociatedObject(self, (__bridge const void *)(key));
}

- (void)setWeakAssociateValue:(id)value forKey:(const NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void *)(key), value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setCopyAssociateValue:(id)value forKey:(const NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void *)(key), value, OBJC_ASSOCIATION_COPY);
}

#pragma mark - 实用方法

- (NSString*)className
{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}

@end
