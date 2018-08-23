//
//  GSFileUtil.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZFileUtil : NSObject

/**
 *  从路径中获得完整的文件名（带后缀）
 *
 *  @param filePath 文件路径
 *
 *  @return 文件名
 */
- (NSString*)getFileNameWithSuffixByFilePath:(NSString*)filePath;

/**
 *  从路径中获得文件名（不带后缀）
 *
 *  @param filePath 文件路径
 *
 *  @return 文件名
 */
- (NSString*)getFileNameWithoutSuffixByFilePath:(NSString*)filePath;


/**
 *  获得文件的后缀名（不带'.'）
 *
 *  @param filePath 文件路径
 *
 *  @return 文件名
 */
- (NSString*)getFileSuffixByFilePath:(NSString*)filePath;

@end
