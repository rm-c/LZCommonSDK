//
//  GSGlobal.h
//  MMC_Core
//
//  Created by maochao04 on 2017/2/21.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#ifndef GSGlobal_h
#define GSGlobal_h

// 设备判断
#define LZ_IS_IPAD                             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define LZ_IS_IPHONE                           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define LZ_IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 屏幕相关
#define LZ_VERTICAL_NAVIGATION_BAR_HEIGHT      44
#define LZ_VERTICAL_SCREEN_WIDTH               [GSScreenUtil getVerticalWidthOfScreen]           //竖屏宽度
#define LZ_VERTICAL_SCREEN_HEIGHT              [GSScreenUtil getVerticalHeightOfScreen]          //竖屏高度
#define LZ_HORIZONTAL_SCREEN_WIDTH             [GSScreenUtil getHorizontalWidthOfScreen]         //横屏宽度
#define LZ_HORIZONTAL_SCREEN_HEIGHT            [GSScreenUtil getHorizontalHeightOfScreen]        //横屏高度
#define LZ_STATUS_BAR_HEIGHT                   [GSScreenUtil getStatusBarHeight]                 //状态栏高度
#define LZ_SCREEN_BOUNDS                       ([UIScreen mainScreen].bounds)                    //当前屏幕的bounds
#define LZ_SCREEN_HEIGHT                       ([UIScreen mainScreen].bounds.size.height)        //当前屏幕的高
#define LZ_SCREEN_WIDTH                        ([UIScreen mainScreen].bounds.size.width)         //当前屏幕的宽

#define LZ_IS_RETINA                           ([[UIScreen mainScreen] scale] >= 2.0)
#define LZ_IS_RETINA_HD                        ([[UIScreen mainScreen] scale] >= 3.0)
#define LZ_SCREEN_MAX_LENGTH                   (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define LZ_SCREEN_MIN_LENGTH                   (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define LZ_IS_SCREEN_3_5                       (LZ_IS_IPHONE && LZ_SCREEN_MAX_LENGTH == 480.0)           // 3.5英寸屏幕
#define LZ_IS_SCREEN_4_0                       (LZ_IS_IPHONE && LZ_SCREEN_MAX_LENGTH == 568.0)           // 4.0英寸屏幕
#define LZ_IS_SCREEN_4_7                       (LZ_IS_IPHONE && LZ_SCREEN_MAX_LENGTH == 667.0)           // 4.7英寸屏幕
#define LZ_IS_SCREEN_5_5                       (LZ_IS_IPHONE && LZ_SCREEN_MAX_LENGTH == 736.0)           // 5.5英寸屏幕
#define LZ_IS_SCREEN_5_8                       (LZ_IS_IPHONE && LZ_SCREEN_MAX_LENGTH == 812.0)           // 5.8英寸屏幕
#define LZ_SCREEN_SCALE_320                    (MIN(LZ_SCREEN_WIDTH,LZ_SCREEN_HEIGHT) / 320.0)
#define LZ_SCREEN_SCALE_375                    (MIN(LZ_SCREEN_WIDTH,LZ_SCREEN_HEIGHT) / 375.0)

// 系统判断
#define LZ_IS_IOS6                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 6) //是否是运行iOS6及以的系统
#define LZ_IS_IOS7                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 7) //是否是运行iOS7及以上系统
#define LZ_IS_IOS8                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 8) //是否是运行iOS8以上系统
#define LZ_IS_IOS9                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 9) //是否是运行iOS9以上系统
#define LZ_IS_IOS10                            ([GSDeviceUtil getDeviceSystemMajorVersion] >= 10)//是否是运行iOS10系统

// 颜色快捷方式
#define lz_UIColorFromRGB(rgbValue)            [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                                            green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                                             blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define lz_UIColorFromR_G_B_A(r,g,b,a)         [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]
#define lz_UIColorFromR_G_B(r,g,b)             UIColorFromR_G_B_A(r,g,b,1.0)

//文件操作相关
#define lz_FilePathInSandBox(fileName)         [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]
#define lz_FilePathInMainBundle(file, ext)     [[NSBundle mainBundle]pathForResource:(file) ofType:(ext)]
#define lz_FileExistsAtPath(filePath)          [[NSFileManager defaultManager] fileExistsAtPath:filePath]

//空值判断
#define lz_IsEmpty(thing)                      [LZCommonUtil isEmpty:(thing)]
#define lz_IsNotEmpty(thing)                   [LZCommonUtil isNotEmpty:(thing)]

#define lz_IsRespondsToSelector(target, selectorName)  ((target) && [(target) respondsToSelector:NSSelectorFromString(selectorName)])

// 强引用弱引用转换
#define LZ_DECLARE_WEAK_SELF                   __weak __typeof(self) weakSelf = self               //声明self弱引用
#define LZ_DECLARE_WEAK_OBJ(o)                 __weak typeof(o) o##Weak = o;     //声明对象弱引用
#define LZ_DECLARE_STRONG_OBJ(o)               __strong typeof(o) o = o##Weak;   //声明对象强引用

// 属性声明
#define LZ_DECLARE_OBJECT_PROPERTY(className, propertyName)            @property(nonatomic, strong)className* propertyName;      // 声明对象属性，默认强引用
#define LZ_DECLARE_VALUE_PROPERTY(type, propertyName)                  @property(nonatomic, assign)type propertyName;            // 声明值属性
#define LZ_DECLARE_WEAK_OBJECT_PROPERTY(className, propertyName)       @property(nonatomic, weak)className* propertyName;        // 声明弱引用对象属性
#define LZ_DECLARE_COPY_OBJECT_PROPERTY(className, propertyName)       @property(nonatomic, copy)className* propertyName;        // 声明copy对象属性


#endif /* GSGlobal_h */
