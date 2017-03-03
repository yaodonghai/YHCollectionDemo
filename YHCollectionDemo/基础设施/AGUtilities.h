//
//  APUilities.h
//  LittleGame
//
//  Created by Mao on 14-8-14.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ag_to_string(x) @#x
#define AGSizeByScreenScale(x) CGSizeMake(x.width * [UIScreen mainScreen].scale, x.height * [UIScreen mainScreen].scale) 
// 6+适配
#define AGValueMultiRatio(x) (floor((x) * [AGUtilities screenWidthRatio]))
///单精度浮点数相等比较
#define AGFloatCompare(x,y) (fabsf(x-y) < FLT_EPSILON)
///双精度浮点数相等比较
#define AGDoubleCompare(x,y) (fabs(x-y) < DBL_EPSILON)
///CGFloat相等比较
#if CGFLOAT_IS_DOUBLE
#define AGCGFloatCompare(x,y)  AGDoubleCompare(x,y)
#else
#define AGCGFloatCompare(x,y)  AGFloatCompare(x,y)
#endif

///判断一个单精度浮点数是否等0
#define AGFloatIsZero(x) AGFloatCompare(x, 0)
///判断一个双精度浮点数是否等0
#define AGDoubleIsZero(x) AGDoubleCompare(x, 0)
///判断一个CGFloat是否等0
#define AGCGFloatIsZero(x) AGCGFloatCompare(x, 0)

/**
 工具类
 */
@interface AGUtilities : NSObject
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
+ (CGFloat)onePixelHeight;
+ (CGFloat)portraitScreenWidth;
+ (CGFloat)portraitScreenHeight;
//屏幕宽度比例，以iPhone6为基准
+ (CGFloat)screenWidthRatio;
+ (CGFloat)screen47Width;
+ (CVPixelBufferRef)createPixelBufferFromCGImage:(CGImageRef)image;
+ (void)forceToOrientation:(UIDeviceOrientation)orientation;
/// 判断是否横屏
+ (BOOL)isStatusLandscape;
@end
