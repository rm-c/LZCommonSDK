//
//  GSAudioUtil.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LZAudioUtil.h"
#import <AVFoundation/AVFoundation.h>

@implementation LZAudioUtil

/**
 *  屏蔽静音键
 */
- (void)maskMuteKey
{
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
}

- (void)playAudioWithPath:(NSString*)path
{
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound(soundID);
}

@end
