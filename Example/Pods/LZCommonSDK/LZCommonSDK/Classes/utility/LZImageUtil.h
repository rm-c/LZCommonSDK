//
//  GSImageUtil.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZImageUtil : NSObject

/**
 *  根据图片url获取图片尺寸
 *
 *  @param imageURL 图片URL(NSURL或NSString类型)
 *
 *  @return 图片尺寸
 */
+(CGSize)getImageSizeWithURL:(id)imageURL;


/**
 裁剪图片

 @param image 原始图片
 @param maskImage 模板遮罩
 @return 裁剪后图片
 */
+ (UIImage*)maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

@end
