//
//  GSFileUtil.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZFileUtil : NSObject

- (NSString*)getFileNameWithSuffixByFilePath:(NSString*)filePath;   // 从路径中获得完整的文件名（带后缀）

- (NSString*)getFileNameWithoutSuffixByFilePath:(NSString*)filePath;    // 从路径中获得文件名（不带后缀）

- (NSString*)getFileSuffixByFilePath:(NSString*)filePath;   // 获得文件的后缀名（不带'.'）

- (id)unarchiverObjectFromFile:(NSString*)filePath key:(NSString*)key;  // 文件解归档到对象

- (BOOL)archiverObject:(id)obj toFile:(NSString*)filePath key:(NSString*)key;   // 对象归档到文件

@end
