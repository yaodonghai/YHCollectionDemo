//
//  UIView+AGParticleAnimation.m
//  MonkeyKingTV
//
//  Created by yaodonghai on 16/11/14.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "UIView+AGParticleAnimation.h"

@implementation UIView (AGParticleAnimation)

/**
 *  显示烟花
 *
 *  @param position 在view 显示的位置
 *  @param images 烟花元素图片
 */
-(void)showFireworksWithPosition:(CGPoint)position snowflakes:(NSArray*)images{
    
    CAEmitterLayer *  fireworksLayer = [CAEmitterLayer layer];
    
    fireworksLayer.emitterPosition = position;//发射源位置
    fireworksLayer.emitterSize	= CGSizeMake(50, 50);//发射源尺寸大小
    fireworksLayer.emitterMode	= kCAEmitterLayerOutline;//发射源模式
    fireworksLayer.emitterShape	= kCAEmitterLayerLine;//发射源的形状
    fireworksLayer.renderMode    = kCAEmitterLayerOldestLast;//渲染模式
    fireworksLayer.velocity      = -1;//发射方向
    fireworksLayer.seed = 1;//用于初始化随机数产生的种子
    
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;		// at the end of travel//粒子产生系数，默认为1.0
    burst.velocity			= 0;    //速度
    burst.scale				= 0.2;  //缩放比例
    burst.speed = +1.0;
    burst.lifetime			= 0.35; //生命周期
    burst.scale			= 0.5;//缩放比例
    
    NSMutableArray * snowflakes = [NSMutableArray arrayWithCapacity:images.count];
    
    [images enumerateObjectsUsingBlock:^(UIImage *  obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 火花 and finally, the sparks
        CAEmitterCell* spark = [CAEmitterCell emitterCell];
        
        spark.birthRate			= 120;//粒子产生系数，默认为1.0
        spark.velocity			= 125;//速度
        spark.emissionRange		= 2* M_PI;	// 360 deg//周围发射角度
        spark.yAcceleration		= 75;		// gravity//y方向上的加速度分量
        spark.lifetime			= 0.6;    //粒子生命周期
        spark.contents			= (id) [obj CGImage];
        //是个CGImageRef的对象,既粒子要展现的图片
        spark.contentsScale = 0.4;
        spark.scale                   = 0.1;
        spark.scaleSpeed              = 0.1;//缩放比例速度
        spark.alphaSpeed		=-0.5; //粒子透明度在生命周期内的改变速度
        spark.spin				= 2* M_PI;  //子旋转角度
        spark.spinRange			= 2* M_PI;  //子旋转角度范围
        
        [snowflakes addObject:spark];
        
    }];
    
    burst.emitterCells = snowflakes;
    fireworksLayer.emitterCells = [NSArray arrayWithObject:burst];
    
    [self.layer addSublayer:fireworksLayer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (fireworksLayer) {
            fireworksLayer.birthRate = 0;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (fireworksLayer)
            {//移除
                [fireworksLayer removeFromSuperlayer];
            }
        });
    });
    
}


/**
 *  显示下雪动画
 *
 *  @param position 在view 显示的位置
 *  @param images 雪花元素图片
 */
- (void)showSnowWithPosition:(CGPoint)position snowflakes:(NSArray*)images{
    // 配置发射器
    CAEmitterLayer *  fireworksLayer = [CAEmitterLayer layer];
    fireworksLayer.emitterPosition = position;
    //发射源的尺寸大小
    fireworksLayer.emitterSize     = CGSizeMake([AGUtilities screenWidth], 30);
    //发射模式
    fireworksLayer.emitterMode     = kCAEmitterLayerOutline;
    //发射源的形状
    fireworksLayer.emitterShape    = kCAEmitterLayerLine;
    fireworksLayer.renderMode      = kCAEmitterLayerOldestLast;
    
    NSMutableArray * snowflakes = [NSMutableArray arrayWithCapacity:images.count];

    [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CAEmitterCell *snowflake          = [CAEmitterCell emitterCell];
        //粒子的名字
        snowflake.name                    =    [NSString stringWithFormat:@"sprite%lu",(unsigned long)idx];        //粒子参数的速度乘数因子
        snowflake.birthRate               = 12;
        snowflake.lifetime                =  arc4random() % 10;;
        //粒子速度
        snowflake.velocity                = 10;
        //粒子的速度范围
        snowflake.velocityRange           = 100;
        //粒子y方向的加速度分量
        snowflake.yAcceleration           = 100;
        //snowflake.xAcceleration = 200;
        //周围发射角度
        snowflake.emissionRange           = 0.25*M_PI;
        //snowflake.emissionLatitude = 200;
        snowflake.emissionLongitude       = 2*M_PI;//
        //子旋转角度范围
        snowflake.spinRange               = 2*M_PI;
        
        snowflake.contents                = (id)[obj CGImage];
        snowflake.contentsScale = 0.9;
        snowflake.scale                   = 0.1;
        snowflake.scaleSpeed              = 0.1;
        [snowflakes addObject:snowflake];
        
    }];
    
    fireworksLayer.emitterCells = snowflakes;
    [self.layer addSublayer:fireworksLayer];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        fireworksLayer.birthRate = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [fireworksLayer removeFromSuperlayer];
           
        });
    });
    
}
@end
