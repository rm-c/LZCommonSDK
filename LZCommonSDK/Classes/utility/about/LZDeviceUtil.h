//
//  GSDeviceUtil.h
//  GSCoreCommon
//
//  Created by zhenwei on 13-11-20.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZDeviceUtil : NSObject

+ (NSUInteger)getDeviceSystemMajorVersion;  // 获取系统iOS主版本号
+ (NSString*)getDeviceSystemVersionString;  // 获取系统iOS版本号

/**
 *  获取设备机型
 *
 *  @return 机型
 */
+ (NSString*)getDeviceModel;

/**
 *  获取屏幕分辨率
 *
 *  @return 屏幕分辨率 eg:320*480
 */
+ (NSString*)getDeviceScreenResolution;

/**
 *  获取设备名称
 *
 *  @return 设备名称
 */
+ (NSString*)getDeviceName;

/**
 *  根据Keychain文件,获取设备UUID
 *
 *  @return 设备唯一设备号
 */
+ (NSString*)getDeviceUUID;

@end
