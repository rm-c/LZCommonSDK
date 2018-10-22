//
//  GSVideoUtil.m
//  MMC_BabyLearn
//
//  Created by maochao04 on 2017/4/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LZVideoUtil.h"
#import <AVFoundation/AVFoundation.h>

@implementation LZVideoUtil

+ (NSTimeInterval)getVideoTotalTime:(NSURL*)videoUrl
{
    if (videoUrl == nil) {
        return 0;
    }
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:videoUrl options:opts];  // 初始化视频媒体文件
    NSTimeInterval second = urlAsset.duration.value / urlAsset.duration.timescale; // 获取视频总时长,单位秒
    return second;
}

+ (UIImage*)getPreviewWithUrl:(NSURL*)videoUrl
{
    NSURL *url = videoUrl;
    AVURLAsset *asset1 = [[AVURLAsset alloc] initWithURL:url options:nil];
    AVAssetImageGenerator *generate1 = [[AVAssetImageGenerator alloc] initWithAsset:asset1];
    generate1.appliesPreferredTrackTransform = YES;
    NSError *err = NULL;
    CMTime time = CMTimeMake(1, 2);
    CGImageRef oneRef = [generate1 copyCGImageAtTime:time actualTime:NULL error:&err];
    UIImage *one = [[UIImage alloc] initWithCGImage:oneRef];
    return one;
}

@end
