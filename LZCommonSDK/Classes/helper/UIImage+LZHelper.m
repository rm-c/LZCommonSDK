//
//  UIImage+LZHelper.m
//  MMC_Core
//
//  Created by maochao04 on 2017/2/27.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIImage+LZHelper.h"
#import "NSMutableArray+LZHelper.h"

@implementation UIImage (LZHelper)

- (CGFloat)width
{
    return self.size.width;
}

- (CGFloat)height
{
    return self.size.height;
}

+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage*)imageName:(NSString*)imageName capInsets:(UIEdgeInsets)capInsets
{
    return [[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets];
}

+ (UIImage*)imageWithPath:(NSString*)imagePath
{
    NSData* data = [NSData dataWithContentsOfFile:imagePath];
    UIImage* image  = [UIImage imageWithData:data];
    return image;
}

+ (UIImage*)imageNamed:(NSString*)name ofType:(NSString*)type
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type]];
}

- (UIImage *)resizeImageToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width, newSize.height));
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newSizeImage;
}

+ (UIImage*)animateImageWithImageNames:(NSArray*)imageNames duration:(NSTimeInterval)duration
{
    NSMutableArray*  imageArr = [NSMutableArray array];
    for (NSString* imageName in imageNames) {
        [imageArr addObjectSafely:[UIImage imageNamed:imageName]];
    }
    return  [UIImage animatedImageWithImages:imageArr duration:duration];
}

- (UIImage *)clipImageInRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
}

- (UIImage*)convertToGrayImage
{
    int width = self.size.width;
    int height = self.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), self.CGImage);
    CGImageRef contextRef = CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:contextRef];
    CGContextRelease(context);
    CGImageRelease(contextRef);
    
    return grayImage;
}

- (BOOL)isEqualToImage:(id)image
{
    NSData *data1 = UIImagePNGRepresentation(image);
    NSData *data2 = UIImagePNGRepresentation(image);
    return [data1 isEqual:data2];
}

- (BOOL)hasAlphaChannel
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

@end
