//
//  AppearanceService.h
//  LittleGame
//
//  Created by Mao on 14-8-22.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import "AGBaseService.h"

/**
 *  外观服务
 */
@interface AGAppearanceService : AGBaseService
+ (void)setDefaultAppearanceSetting;
@end

@interface UIColor (AGAppearance)
///  @brief 提现界面
+ (UIColor *)ag_B1;
+ (UIColor *)ag_B2;
+ (UIColor *)ag_B3;

+ (UIColor *)ag_G0;

///  @brief 用于重要的文字信息、内容标题信息。
///  @brief 如视频标题，按钮文字等
+ (UIColor *)ag_G1;

///  @brief 用于用户信息、二级文字
///  @brief 如个人页面信息等
+ (UIColor *)ag_G2;

///  @brief 用于次要和候选文字
///  @brief 如播放次数和 tab 未选中项等
+ (UIColor *)ag_G3;

///  @brief 背景颜色
+ (UIColor *)ag_G4;

///  @brief 用于弹框内容文字颜色
+ (UIColor *)ag_G5;
///  @brief 用于分割线
+ (UIColor *)ag_G6;
+ (UIColor *)ag_G7;

+ (UIColor *)ag_P1;
+ (UIColor *)ag_P2;

+ (UIColor *)ag_R1;

///  @brief 白色
+ (UIColor *)ag_W1;

///  @brief 用于凸显的按钮和 icon
///  @brief 如首页 tab icon，和+关注 icon 等
+ (UIColor *)ag_Y1;
///  @brief 蟠桃界面
+ (UIColor *)ag_Y2;
+ (UIColor*)ag_Y3;
+ (UIColor*)ag_Y4;
///  @brief 用于重要的连接文字和错误提示文字颜色
+ (UIColor*)ag_O1;
@end

@interface UIFont (AGAppearance)
+ (UIFont *)ag_lightFontOfSize:(NSInteger)size;
+ (UIFont *)ag_regularFontOfSize:(NSInteger)size;
+ (UIFont *)ag_mediumFontOfSize:(NSInteger)size;
+ (UIFont*)ag_boldFontOfSize:(NSInteger)size;
@end
