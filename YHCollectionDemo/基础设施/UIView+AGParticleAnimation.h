//
//  UIView+AGParticleAnimation.h
//  MonkeyKingTV
//
//  Created by yaodonghai on 16/11/14.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AGParticleAnimation)

/**
 *  显示烟花
 *
 *  @param position 在view 显示的位置
 *  @param images 烟花元素图片
 */
-(void)showFireworksWithPosition:(CGPoint)position snowflakes:(NSArray*)images;

/**
 *  显示下雪动画
 *
 *  @param position 在view 显示的位置
 *  @param images 雪花元素图片
 */
- (void)showSnowWithPosition:(CGPoint)position snowflakes:(NSArray*)images;
@end
