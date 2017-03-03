//
//  APUilities.m
//  LittleGame
//
//  Created by Mao on 14-8-14.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import "AGUtilities.h"
#import <CoreText/CoreText.h>
#import <ImageIO/ImageIO.h>

@implementation AGUtilities
+ (CGFloat)screenWidth{
    return [[UIScreen mainScreen] bounds].size.width;
}
+ (CGFloat)screenHeight{
    return [[UIScreen mainScreen] bounds].size.height;
}
+ (CGFloat)onePixelHeight{
    return 1.0/[[UIScreen mainScreen] scale];
}
+ (CGFloat)portraitScreenWidth{
    return [UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale;
}
+ (CGFloat)portraitScreenHeight{
    
    return [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale;
}
+ (CGFloat)screenWidthRatio{
    if ([UIScreen mainScreen].nativeScale > 2.1) {
        return [self portraitScreenWidth] / [self screen47Width];
    } else {
        return 1;
    }
}
+ (CGFloat)screen47Width{
    return 375;
}

+ (CVPixelBufferRef)createPixelBufferFromCGImage:(CGImageRef)image{
    CGSize frameSize = CGSizeMake(CGImageGetWidth(image),
                                  CGImageGetHeight(image));
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:@YES, kCVPixelBufferCGImageCompatibilityKey,
                             @YES, kCVPixelBufferCGBitmapContextCompatibilityKey, nil];
    CVPixelBufferRef pxbuffer = NULL;
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault, frameSize.width, frameSize.height, kCVPixelFormatType_32BGRA, (__bridge CFDictionaryRef)options, &pxbuffer);
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(
                                                 pxdata, frameSize.width, frameSize.height,
                                                 8, CVPixelBufferGetBytesPerRow(pxbuffer),
                                                 rgbColorSpace,
                                                 (CGBitmapInfo)kCGBitmapByteOrder32Little |
                                                 kCGImageAlphaPremultipliedFirst);
    
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(image),
                                           CGImageGetHeight(image)), image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    return pxbuffer;
}

+ (void)forceToOrientation:(UIDeviceOrientation)orientation
{
    NSNumber *orientationUnknown = [NSNumber numberWithInt:0];
    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:orientation];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}

+ (BOOL)isStatusLandscape{
    if ([UIApplication sharedApplication].statusBarFrame.size.width > [AGUtilities portraitScreenWidth]) {
        return YES;
    }
    return NO;
}
@end
