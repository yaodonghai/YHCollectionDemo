//
//  AGMessageView.m
//  MonkeyKingTV
//
//  Created by 姚东海 on 16/7/13.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "AGMessageView.h"

#define kDefault_height (AGValueMultiRatio(70) + AGStatusBarHeight)
#define kDefault_duration 5

@interface AGMessageView(){
    CGFloat  _duration;
}

@end
@implementation AGMessageView


- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                      iconUrl:(NSString *)icon
                  messageType:(AGMessageViewType)type
              messagePosition:(AGMessagePosition)position
                     duration:(CGFloat)duration {
    if (self = [super init]) {
        _duration = duration > 0 ? duration : kDefault_duration;
    
        self.userInteractionEnabled = YES;
        if (type == AGMessageViewTypeWarning) {
            self.backgroundColor = [UIColor ag_O1];
        } else {
            self.backgroundColor = [UIColor ag_Y1];
        }

        UIView * contentView = [UIView new];
        contentView.backgroundColor = self.backgroundColor;
        [self addSubview:contentView];
        contentView.el_edgesToSuperView(AGStatusBarHeight,0,0,0);
        
        UIImageView *iconImageView = [UIImageView new];
        [contentView addSubview:iconImageView];

        UILabel *titleLable = [UILabel new];
        titleLable.font = [UIFont ag_mediumFontOfSize:AGValueMultiRatio(16)];
        titleLable.textColor = [UIColor ag_G1];
        [contentView addSubview:titleLable];
        
        UILabel *subTitleLable = [UILabel new];
        subTitleLable.font = [UIFont ag_regularFontOfSize:AGValueMultiRatio(12)];
        subTitleLable.textColor = [UIColor ag_G1];
        [contentView addSubview:subTitleLable];
        
        iconImageView.el_leftToSuperView(AGValueMultiRatio(16)).el_axisYToSuperView(0);
            iconImageView.el_toSize(CGSizeMake(AGValueMultiRatio(42), AGValueMultiRatio(42)));
  
        if (icon.length) { //有头像
            if (subTitle.length) {
                titleLable.el_topToTop(iconImageView, 0).el_leftToRight(iconImageView, AGValueMultiRatio(16));
                subTitleLable.el_topToBottom(titleLable, 4).el_leftToRight(iconImageView, AGValueMultiRatio(16));
            } else {
                titleLable.el_axisYToSuperView(0).el_leftToRight(iconImageView, AGValueMultiRatio(16));
            }
        } else {
            titleLable.el_axisYToSuperView(0).el_leftToSuperView(AGValueMultiRatio(16));
        }
        titleLable.el_rightToSuperView(16);
        subTitleLable.el_rightToSuperView(16);

        titleLable.text = title;
        subTitleLable.text = subTitle;
        [iconImageView sd_setImageWithURL:[icon toURL] placeholderImage:nil options:SDWebImageAvoidAutoSetImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                 iconImageView.image = [image imageWithRoundedSize:CGSizeMake(AGValueMultiRatio(42), AGValueMultiRatio(42)) borderWidth:0];
            }
        }];
        
        UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        [self addGestureRecognizer:gesture];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGesture];
    }
    
    return self;
}

- (void)handleTap:(UITapGestureRecognizer *)gesture {
    [self hidedMessageViewWithSure:YES];
}

- (void)handleSwipe:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:gesture.view];
    if (gesture.state == UIGestureRecognizerStateChanged) {
        if (self.el_currentConstraint.constant <= 0.1) {
            self.el_currentConstraint.constant = translation.y > 0 ? 0 : translation.y;
        }
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        if (fabs(self.el_currentConstraint.constant) > kDefault_height * 0.5) {
            [self hidedMessageViewWithSure:NO];
        } else {
            [UIView animateWithDuration:0.2 animations:^{
                self.el_currentConstraint.constant = 0;
                [[UIApplication sharedApplication].keyWindow layoutIfNeeded];
            }];
        }
    }
 }


- (void)showMessageView {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.el_leftToSuperView(0).el_rightToSuperView(0).el_toHeight(kDefault_height).el_topToSuperView(-(kDefault_height));
    [[UIApplication sharedApplication].keyWindow layoutIfNeeded];

    [UIView animateWithDuration:0.6
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionShowHideTransitionViews
                     animations:^{
                         self.el_currentConstraint.constant = 0.0;
                         [[UIApplication sharedApplication].keyWindow layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         [self performSelector:@selector(hidedMessageViewWithSure:) withObject:nil afterDelay:_duration];
                     }];
}


- (void)hidedMessageViewWithSure:(BOOL)sure {
    NSTimeInterval time = 0.6 * fabs(self.el_currentConstraint.constant + kDefault_height) / kDefault_height;
    [UIView animateWithDuration:time
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionShowHideTransitionViews
                     animations:^{
                         self.el_currentConstraint.constant = - kDefault_height;
                         [[UIApplication sharedApplication].keyWindow layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
    if (sure && self.tapBlock) {
        self.tapBlock();
    }
}

- (void)dealloc {
    NSLog(@"!!---> dealloc");
}

@end
