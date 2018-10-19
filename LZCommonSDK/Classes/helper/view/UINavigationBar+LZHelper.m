//
//  UINavigationBar+LZHelper.m
//  LZCommonSDK
//
//  Created by Macye on 2018/10/19.
//

#import "UINavigationBar+LZHelper.h"

@implementation UINavigationBar (LZHelper)

- (void)setTitleFont:(UIFont*)font color:(UIColor*)color
{
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:font}];
}

@end
