//
//  GSDeviceUtil.m
//  GSCoreCommon
//
//  Created by zhenwei on 13-11-20.
//  Copyright (c) 2013年 linzhenwei. All rights reserved.
//

#import "LZDeviceUtil.h"
#import <sys/sysctl.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#import <sys/socket.h>
#import <sys/param.h>
#import <sys/mount.h>
#import <sys/stat.h>
#import <sys/utsname.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <mach/processor_info.h>
#import "SSKeychain.h"

@implementation LZDeviceUtil

+ (NSUInteger)getDeviceSystemMajorVersion
{
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;
}

+ (NSString*)getDeviceSystemVersionString
{
    static NSString* _deviceSystemVersion = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemVersion = [[UIDevice currentDevice] systemVersion];
    });
    return _deviceSystemVersion;
}

+ (NSString*)getDeviceModel
{
    // NOT COMPLETE, DONT USE
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *model = [NSString stringWithUTF8String:machine];
    free(machine);
    if ([model isEqualToString:@"i386"]||[model isEqualToString:@"x86_64"])
        model= @"Simulator";
    
    return model;
}

+ (NSString*)getDeviceScreenResolution
{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width * [[UIScreen mainScreen] scale];
    CGFloat screenHeight= [[UIScreen mainScreen] bounds].size.height * [[UIScreen mainScreen] scale];
    
    NSString* resolution = [NSString stringWithFormat:@"%0.0f*%0.0f",screenWidth,screenHeight];
    
    return resolution;
}

+ (NSString*)getDeviceName
{
    NSString* deviceModel = [LZDeviceUtil getDeviceModel];
    
    if ([deviceModel isEqualToString:@"iPhone2,1"]) {
        return @"IPHONE 3GS";
    }
    else if ([deviceModel isEqualToString:@"iPhone3,1"]){
        return @"IPHONE4";
    }
    else if ([deviceModel isEqualToString:@"iPhone3,2"]){
        return @"IPHONE4";
    }
    else if ([deviceModel isEqualToString:@"iPhone3,3"]){
        return @"IPHONE4";
    }
    else if ([deviceModel isEqualToString:@"iPhone4,1"]){
        return @"IPHONE4S";
    }
    else if ([deviceModel isEqualToString:@"iPhone5,1"]){
        return @"IPHONE5";
    }
    else if ([deviceModel isEqualToString:@"iPhone5,2"]){
        return @"IPHONE5";
    }
    else if ([deviceModel isEqualToString:@"iPhone5,3"]){
        return @"iPhone5c";
    }
    else if ([deviceModel isEqualToString:@"iPhone5,4"]){
        return @"iPhone5c";
    }
    else if ([deviceModel isEqualToString:@"iPhone6,1"]){
        return @"iPhone5s";
    }
    else if ([deviceModel isEqualToString:@"iPhone6,2"]){
        return @"iPhone5s";
    }
    else if ([deviceModel isEqualToString:@"iPod4,1"]){
        return @"iPod touch4";
    }
    else if ([deviceModel isEqualToString:@"iPod5,1"]){
        return @"iPod touch5";
    }
    else if ([deviceModel isEqualToString:@"iPad2,1"]){
        return @"iPad 2 Wi-Fi";
    }
    else if ([deviceModel isEqualToString:@"iPad2,2"]){
        return @"iPad 2 Wi-Fi+3G+GSM";
    }
    else if ([deviceModel isEqualToString:@"iPad2,3"]){
        return @"iPad 2 Wi-Fi+3G+GSM+CDMA";
    }
    else if ([deviceModel isEqualToString:@"iPad2,4"]){
        return @"iPad 2 Wi-Fi rev_a";
    }
    else if ([deviceModel isEqualToString:@"iPad3,1"]){
        return @"iPad 3 Wi-Fi";
    }
    else if ([deviceModel isEqualToString:@"iPad3,2"]){
        return @"iPad 3 Wi-Fi+3G+GSM+CDMA";
    }
    else if ([deviceModel isEqualToString:@"iPad3,3"]){
        return @"iPad 3 Wi-Fi+3G+GSM";
    }
    else if ([deviceModel isEqualToString:@"iPad2,5"]){
        return @"iPad mini Wi-Fi";
    }
    else if ([deviceModel isEqualToString:@"iPad2,6"]){
        return @"iPad mini Wi-Fi+3G+4G+GSM";
    }
    else if ([deviceModel isEqualToString:@"iPad2,7"]){
        return @"iPad mini Wi-Fi+3G+4G+GSM+CDMA";
    }
    else if ([deviceModel isEqualToString:@"iPad3,4"]){
        return @"iPad 4 Wi-Fi";
    }
    else if ([deviceModel isEqualToString:@"iPad3,5"]){
        return @"iPad 4 Wi-Fi+3G+4G+GSM";
    }
    else if ([deviceModel isEqualToString:@"iPad3,6"]){
        return @"iPad 4 Wi-Fi+3G+4G+GSM+CDMA";
    }
    else return deviceModel;
}

+ (NSString*)getDeviceUUID
{
    NSString *strUUID = [SSKeychain passwordForService:@"keychain-access-groups"account:@"userSecret"];
    if (strUUID.length <= 0)
    {
        CFUUIDRef uuid = CFUUIDCreate(NULL);
        assert(uuid != NULL);
        CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
        [SSKeychain setPassword:[NSString stringWithFormat:@"%@", uuidStr] forService:@"keychain-access-groups" account:@"userSecret"];
    }
    
    return strUUID;
}

+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int result;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &result, &size, NULL, 0);
    return (NSUInteger)result;
}

+ (NSUInteger)getTotalMemoryBytes
{
    return [self getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)getFreeMemoryBytes
{
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vm_stat;
    
    host_page_size(host_port, &pagesize);
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        return 0;
    }
    unsigned long mem_free = vm_stat.free_count * pagesize;
    return mem_free;
}

#pragma mark - disk information

+ (long long)getFreeDiskSpaceBytes
{
    struct statfs buf;
    long long freespace;
    freespace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        freespace = (long long)buf.f_bsize * buf.f_bfree;
    }
    return freespace;
}

+ (long long)getTotalDiskSpaceBytes
{
    struct statfs buf;
    long long totalspace;
    totalspace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        totalspace = (long long)buf.f_bsize * buf.f_blocks;
    }
    return totalspace;
}

/*!
 *  强制锁定屏幕方向
 *
 *  @param orientation 屏幕方向
 */
+ (void)setDeviceInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    // arc下
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

@end
