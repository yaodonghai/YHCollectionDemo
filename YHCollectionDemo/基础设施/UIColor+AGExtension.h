//
//  AGExtension.h
//  LittleGame
//
//  Created by Mao on 14-8-22.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(AGExtension)
+ (UIColor *)R:(NSInteger)r G:(NSInteger)g B:(NSInteger)b A:(NSInteger)a;
+ (UIColor *)R:(NSInteger)r G:(NSInteger)g B:(NSInteger)b;
+ (UIColor *)HEX:(NSInteger)hex;
+ (UIColor *)HEXA:(NSInteger)hex;
+ (UIColor *)randomColor;
@end

@interface UIColor(HLS)
+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;
- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation lightness:(CGFloat *)lightness alpha:(CGFloat *)alpha;
- (UIColor *)offsetWithHue:(CGFloat)h saturation:(CGFloat)s lightness:(CGFloat)l alpha:(CGFloat)alpha;
- (UIColor *)saturate:(CGFloat)amount;
- (UIColor *)desaturate:(CGFloat)amount;
- (UIColor *)lighten:(CGFloat)amount;
- (UIColor *)darken:(CGFloat)amount;
- (UIColor *)spin:(CGFloat)angle;

@end
