//
//  GSFileUtil.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LZFileUtil.h"

@implementation LZFileUtil

- (NSString*)getFileNameWithSuffixByFilePath:(NSString*)filePath
{
    NSString *fileName = [filePath lastPathComponent];
    return fileName;
}

- (NSString*)getFileNameWithoutSuffixByFilePath:(NSString*)filePath
{
    NSString *fileName = [filePath stringByDeletingPathExtension];
    return fileName;
}

- (NSString*)getFileSuffixByFilePath:(NSString*)filePath
{
    NSString *suffix = [filePath pathExtension];
    return suffix;
}

- (id)unarchiverObjectFromFile:(NSString*)filePath key:(NSString*)key
{
    NSData *undata = [[NSData alloc] initWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:undata];
    id unModel = [unarchiver decodeObjectForKey:key];
    [unarchiver finishDecoding];
    return unModel;
}

- (BOOL)archiverObject:(id)obj toFile:(NSString*)filePath key:(NSString*)key
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:obj forKey:key];
    [archiver finishEncoding];
    if([data writeToFile:filePath atomically:YES]){
        return YES;
    }
    return NO;
}

@end
