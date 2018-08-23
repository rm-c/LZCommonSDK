//
//  UIPasteboard+LZHelper.h
//  GSCommonSDK
//
//  Created by maochao04 on 2017/6/13.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPasteboard (LZHelper)

+ (void)copyText:(NSString*)text;

+ (void)copyImage:(UIImage*)image;

+ (void)cancelCopied;

@end
