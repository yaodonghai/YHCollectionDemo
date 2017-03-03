//
//  UIButton+AGExtension.h
//  VideoCommunity
//
//  Created by Mao on 14/12/5.
//  Copyright (c) 2014年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AGExtension)
@property (nonnull, nonatomic, readonly) UIActivityIndicatorView *indicatorView;
@property (nonatomic, assign) BOOL working;
- (void)setTitle:(nonnull NSString *)title font:(nonnull UIFont *)font color:(nonnull UIColor *)color forState:(UIControlState)state;
@end
