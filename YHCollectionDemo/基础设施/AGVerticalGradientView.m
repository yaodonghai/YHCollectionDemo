//
//  AGGradientView.m
//  AGVideo
//
//  Created by Mao on 16/1/13.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "AGVerticalGradientView.h"

@implementation AGVerticalGradientView
+ (Class)layerClass{
    return [CAGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.from = [UIColor clearColor];
    self.to = [UIColor blackColor];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CAGradientLayer *gradientLayer = (CAGradientLayer*)self.layer;
    gradientLayer.startPoint = CGPointMake(0.5, 0.0);
    gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    gradientLayer.colors = @[(id)self.from.CGColor, (id)self.to.CGColor];
    gradientLayer.bounds = CGRectMake(0, 0, self.width, self.height);
}
@end
