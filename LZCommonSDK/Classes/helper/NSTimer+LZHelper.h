//
//  NSTimer+LZHelper.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LZHelper)

#pragma mark - block

+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;

+ (NSTimer*)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;

#pragma mark - util
/**
 *  暂停NSTimer
 */
- (void)pauseTimer;

/**
 *  开始NSTimer
 */
- (void)resumeTimer;

/**
 *  延迟开始NSTimer
 *
 *  @param interval 延时时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
