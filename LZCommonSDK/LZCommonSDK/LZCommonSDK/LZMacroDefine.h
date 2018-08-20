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
#define IS_IPAD                             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE                           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

// 屏幕相关
#define VERTICAL_NAVIGATION_BAR_HEIGHT      44
#define VERTICAL_SCREEN_WIDTH               [GSScreenUtil getVerticalWidthOfScreen]           //竖屏宽度
#define VERTICAL_SCREEN_HEIGHT              [GSScreenUtil getVerticalHeightOfScreen]          //竖屏高度
#define HORIZONTAL_SCREEN_WIDTH             [GSScreenUtil getHorizontalWidthOfScreen]         //横屏宽度
#define HORIZONTAL_SCREEN_HEIGHT            [GSScreenUtil getHorizontalHeightOfScreen]        //横屏高度
#define STATUS_BAR_HEIGHT                   [GSScreenUtil getStatusBarHeight]                 //状态栏高度
#define SCREEN_BOUNDS                       ([UIScreen mainScreen].bounds)                    //当前屏幕的bounds
#define SCREEN_HEIGHT                       ([UIScreen mainScreen].bounds.size.height)        //当前屏幕的高
#define SCREEN_WIDTH                        ([UIScreen mainScreen].bounds.size.width)         //当前屏幕的宽

#define IS_RETINA                           ([[UIScreen mainScreen] scale] >= 2.0)
#define IS_RETINA_HD                        ([[UIScreen mainScreen] scale] >= 3.0)
#define SCREEN_MAX_LENGTH                   (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH                   (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_SCREEN_3_5                       (IS_IPHONE && SCREEN_MAX_LENGTH == 480.0)           // 3.5英寸屏幕
#define IS_SCREEN_4_0                       (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)           // 4.0英寸屏幕
#define IS_SCREEN_4_7                       (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)           // 4.7英寸屏幕
#define IS_SCREEN_5_5                       (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)           // 5.5英寸屏幕
#define SCREEN_SCALE_320                    (MIN(SCREEN_WIDTH,SCREEN_HEIGHT) / 320.0)
#define SCREEN_SCALE_375                    (MIN(SCREEN_WIDTH,SCREEN_HEIGHT) / 375.0)

// 系统判断
#define IS_IOS6                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 6) //是否是运行iOS6及以的系统
#define IS_IOS7                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 7) //是否是运行iOS7及以上系统
#define IS_IOS8                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 8) //是否是运行iOS8以上系统
#define IS_IOS9                             ([GSDeviceUtil getDeviceSystemMajorVersion] >= 9) //是否是运行iOS9以上系统
#define IS_IOS10                            ([GSDeviceUtil getDeviceSystemMajorVersion] >= 10)//是否是运行iOS10系统

// 颜色快捷方式
#define UIColorFromRGB(rgbValue)            [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                                            green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                                             blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromR_G_B_A(r,g,b,a)         [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]
#define UIColorFromR_G_B(r,g,b)             UIColorFromR_G_B_A(r,g,b,1.0)

//文件操作相关
#define FilePathInSandBox(fileName)         [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]
#define FilePathInMainBundle(file, ext)     [[NSBundle mainBundle]pathForResource:(file) ofType:(ext)]
#define FileExistsAtPath(filePath)          [[NSFileManager defaultManager] fileExistsAtPath:filePath]

//空值判断
#define IsEmpty(thing)                      [LZCommonUtil isEmpty:(thing)]
#define IsNotEmpty(thing)                   [LZCommonUtil isNotEmpty:(thing)]

// 强引用弱引用转换
#define DECLARE_WEAK_SELF                   __weak __typeof(self) weakSelf = self               //声明self弱引用
#define DECLARE_WEAK_OBJ(o)                 autoreleasepool{} __weak typeof(o) o##Weak = o;     //声明对象弱引用
#define DECLARE_STRONG_OBJ(o)               autoreleasepool{} __strong typeof(o) o = o##Weak;   //声明对象强引用

// 属性声明
#define DECLARE_OBJECT_PROPERTY(className, propertyName)            @property(nonatomic, strong)className* propertyName;      // 声明对象属性，默认强引用
#define DECLARE_VALUE_PROPERTY(type, propertyName)                  @property(nonatomic, assign)type propertyName;            // 声明值属性
#define DECLARE_WEAK_OBJECT_PROPERTY(className, propertyName)       @property(nonatomic, weak)className* propertyName;        // 声明弱引用对象属性
#define DECLARE_COPY_OBJECT_PROPERTY(className, propertyName)       @property(nonatomic, copy)className* propertyName;        // 声明copy对象属性


#endif /* GSGlobal_h */
