//
//  UIButton+AGExtension.m
//  VideoCommunity
//
//  Created by Mao on 14/12/5.
//  Copyright (c) 2014年 AppGame. All rights reserved.
//

#import "UIButton+AGExtension.h"
#import <objc/runtime.h>
static char WorkingKey;
static const NSInteger AGIndicatorViewTag = 10034;

@interface UIButton ()

@end
@implementation UIButton (AGExtension)
- (BOOL)working{
    return [objc_getAssociatedObject(self, &WorkingKey) boolValue];
}
- (void)setWorking:(BOOL)working{
    objc_setAssociatedObject(self, &WorkingKey, @(WorkingKey), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (working) {
        self.hidden = YES;
        [self.indicatorView startAnimating];
    }else{
        self.hidden = NO;
        [self.indicatorView stopAnimating];
        [self.indicatorView removeFromSuperview];
    }
}
- (nonnull UIActivityIndicatorView*)indicatorView{
    UIActivityIndicatorView *aIndicatorView = (UIActivityIndicatorView*)[self.superview viewWithTag:AGIndicatorViewTag];
    if (!aIndicatorView) {
        aIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [self.superview addSubview:aIndicatorView];
        aIndicatorView.center = self.center;
        aIndicatorView.tag = AGIndicatorViewTag;
        [aIndicatorView setHidesWhenStopped:YES];
        [[[self rac_signalForSelector:@selector(removeFromSuperview)] takeUntil:[self rac_willDeallocSignal]] subscribeNext:^(id x) {
            [aIndicatorView removeFromSuperview];
        }];
    }else{
        [aIndicatorView.superview bringSubviewToFront:aIndicatorView];
    }
    return aIndicatorView;
}

- (void)setTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color forState:(UIControlState)state {
    NSDictionary *attris = @{
                             NSFontAttributeName : font,
                             NSForegroundColorAttributeName : color
                             };
    NSAttributedString *attriString = [[NSAttributedString alloc] initWithString:title attributes:attris];
    [self setAttributedTitle:attriString forState:state];
}

@end
