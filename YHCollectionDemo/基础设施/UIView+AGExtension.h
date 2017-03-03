//
//  UIView+APExtension.h
//  LittleGame
//
//  Created by Mao on 14-8-14.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, AGViewNoticeType) {
    AGViewNoticeTypeNofans=0,//没有粉丝
    AGViewNoticeTypeNoFocus,//没有关注
    AGViewNoticeTypeNoSearch,//搜索没有数据
    AGViewNoticeTypeNoPlayback, //没有回放
    AGViewNoticeTypeNoBlackList ,//没有黑名单
    AGViewNoticeTypeNoExchangePayRecord, //没有充值和兑换记录
    AGViewNoticeTypeuserNoVideos //首页关注的人没有直播和回放


};

typedef NS_ENUM(NSUInteger, AGVmarkSizeType) {
    AGVmarkSizeTypeSmall,
    AGVmarkSizeTypeNormal,
    AGVmarkSizeTypeLarge
};

@interface UIView (APExtension)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat x;

@property (nonatomic) CGFloat y;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic, readonly) CGFloat screenX;

@property (nonatomic, readonly) CGFloat screenY;

@property (nonatomic, readonly) CGRect screenFrame;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

@property (nonatomic, readonly) CGFloat orientationWidth;

@property (nonatomic, readonly) CGFloat orientationHeight;

/**
 *  在自身及子视图中查出cls的实例
 *
 *  @param cls 是要查找的视图类
 *
 *  @return 找到的视图
 */
- (__kindof UIView *)descendantOrSelfWithClass:(Class)cls;

/**
 *  在自身及祖先视图中查出cls的实例
 *
 *  @param cls 是要查找的视图类
 *
 *  @return 找到的视图
 */
- (__kindof UIView *)ancestorOrSelfWithClass:(Class)cls;

- (UITableView*)ag_tableView;

- (void)removeAllSubviews;
- (UIImage*)screenshot;
- (UIViewController*)ag_viewController;
- (UINavigationController*)ag_navigationController;
- (UITabBarController*)ag_tabBarController;
/**
 *  移除和SuperView相关的约束
 */
- (void)removeConstraintsRelatedToSuperView;
- (void)showNoticeWithType:(AGViewNoticeType)type info:(NSString*)info offsetOnHorizontal:(CGFloat)offset;
- (void)showNoticeWithType:(AGViewNoticeType)type info:(NSString*)info;
- (void)hideNotice;
- (void)showNoticeNetworkErrorWithTarget:(id)target Action:(SEL)action;
- (void)showNoticeNetworkErrorWithoffsetOnHorizontal:(CGFloat)offset Target:(id)target Action:(SEL)action;
- (void)ag_showOnWindow;
- (void)ag_hideFromWindow;

- (void)ag_emergeOnWindow;
- (void)ag_sinkFromSuperview;

- (void)ag_emergeOnView:(UIView*)view sinkAfterDelay:(NSTimeInterval)delay;
- (void)ag_emergeOnView:(UIView*)view;

- (void)ag_addSubView:(UIView*)view;
- (void)ag_removeFromSuperview;

- (void)ag_setHidden:(BOOL)hidden;
- (NSLayoutConstraint*)anyTopConstraint;
- (NSLayoutConstraint*)anyLeadingConstraint;
- (NSLayoutConstraint*)anyBottomConstraint;
- (NSLayoutConstraint*)anyTrailingConstraint;
- (NSLayoutConstraint*)anyHeightConstraint;
- (NSLayoutConstraint*)anyWidthConstraint;
- (NSLayoutConstraint*)anyRightConstraint;
- (NSLayoutConstraint*)anyLeftConstraint;
- (void)hideSubviews;
- (void)showSubviews;
- (UIImageView*)addVMarkImageViewWithSize:(CGSize)size;
- (UIImageView*)addVMarkImageViewWithType:(AGVmarkSizeType)type;
/**
 *  广度优先遍历所有子视图
 *
 *  @param block block 应用于遍历子视图
 */
- (void)enumerateAllSubviewsUsingBlock:(void (^)(__kindof UIView *view, NSUInteger idx, BOOL *stop))block;

- (void)ag_logAllGestures;

- (void)ag_tapOnceWithHandler:(void(^)())block;
- (void)ag_removeTapOnceHandler;
#pragma - debug

@end

@interface UIView (Debug)
//开启线框调试
- (void)enableWireFrameDebug;
@end


@interface UIView (SetLines)

- (void)setBottomLineWithColor:(UIColor *)color;

- (void)setTopLineWithColor:(UIColor *)color;

- (void)setRightLineWithColor:(UIColor *)color;

- (void)setLeftLineWithColor:(UIColor *)color;

- (void)setBottomLineWithColor:(UIColor *)lineColor lineHeight:(CGFloat)lineHeight  lineLeft:(CGFloat)lineLeft lineRight:(CGFloat)lineRight;

- (void)setTopLineWithColor:(UIColor *)lineColor lineHeight:(CGFloat)lineHeight  lineLeft:(CGFloat)lineLeft lineRight:(CGFloat)lineRight;
@end


@interface UIView (RoundedCorners)

- (void)setAllCornersRoundedWithRadius:(CGFloat)radius;

- (void)setAllCornersRoundedWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;

- (void)setRoundedCorners:(UIRectCorner)corners borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor radius:(CGFloat)radius;

- (void)setRoundedCorners:(UIRectCorner)corners cornerSize:(CGSize)size;

- (void)setRoundedCorners:(UIRectCorner)corners borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerSize:(CGSize)size;

@end

//边缘渐隐
@interface UIView (EdgeFadeOut)
- (void)setEdgeTopFadeOutWithThickness:(CGFloat)thickness;
- (void)setEdgeTopFadeOut;
@end



