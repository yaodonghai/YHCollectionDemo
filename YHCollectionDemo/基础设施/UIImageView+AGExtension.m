//
//  UIImageView+AGExtension.m
//  AGVideo
//
//  Created by Mao on 15/6/15.
//  Copyright (c) 2015年 AppGame. All rights reserved.
//

#import "UIImageView+AGExtension.h"
#import "UIImage+API.h"
#import "UIImage+AGExtension.h"
#import <objc/runtime.h>
#import "AGFile.h"

static char SettingRemoteImageKey;

@implementation UIImageView (AGExtension)

- (float )screenScaleImageHeightWithImage:(UIImage *)image width:(float)width
{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    float imageScale = imageHeight/imageWidth;
    return width * imageScale;
}
- (void)setRoundedAvatarWithURL:(nonnull NSURL*)URL{
    self.layer.cornerRadius = self.width / 2;
    self.layer.masksToBounds = YES;
    [self sd_setImageWithURL:URL placeholderImage:[UIImage imageForRoundedPlaceholderAvatar]];
}

- (BOOL)settingRemoteImage{
    return [objc_getAssociatedObject(self, &SettingRemoteImageKey) boolValue];
}

- (void)setSettingRemoteImage:(BOOL)b{
    @synchronized(self) {
        objc_setAssociatedObject(self, &SettingRemoteImageKey, @(b), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)setCoverWithColor:(UIColor *)color alpha:(CGFloat)alpha {
    UIView *markView = [UIView new];
    markView.backgroundColor = [color colorWithAlphaComponent:alpha];
    [self addSubview:markView];
    markView.el_edgesStickToSuperView();
}

- (void)setDefaultCoverColor {
    [self setCoverWithColor:[UIColor ag_G0] alpha:0.4];
}

- (void)ag_setImageWithAgfile:(AGFile *)file {
    [self sd_setImageWithURL:[file.url toURL] placeholderImage:[UIImage imageForNomalPlaceholderView]];
}

- (void)ag_setImageWithAgfile:(AGFile *)file placeholderImage:(UIImage *)placeholderImage {
    [self sd_setImageWithURL:[file.url toURL] placeholderImage:placeholderImage];
}
@end
