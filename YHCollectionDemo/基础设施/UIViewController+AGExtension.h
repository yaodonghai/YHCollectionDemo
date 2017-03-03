//
//  UIViewController+AGExtension.h
//  LittleGame
//
//  Created by Mao on 14-8-25.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (AGTools)
- (UIViewController *)ag_fatherViewController;

///获取当前展示view的view controller
+ (UIViewController *)ag_currentViewController;

//获取root view controller
+ (UIViewController *)ag_rootController;

//获取当前的导航控制器
+ (UINavigationController*)ag_currentNavigationController;

+ (UIViewController*)ag_findFirstViewControllerOnDisplayingWithClass:(Class)aClass;
@end

@interface UIViewController (AGHUD)
- (MBProgressHUD*)hud;
- (void)showHUDWithInfo:(NSString*)info;
- (void)showHUDWithInfo:(NSString*)info completionBlock:(void(^)())block;
- (void)showHUDWithInfo:(NSString*)info hideAfterDelay:(NSTimeInterval)delay;
- (void)showHUDWithInfo:(NSString*)info hideAfterDelay:(NSTimeInterval)delay completionBlock:(void(^)())block;
- (void)showHUDWithTitle:(NSString*)title info:(NSString*)info hideAfterDelay:(NSTimeInterval)delay completionBlock:(void(^)())block;
//通用loading 内容不可以点击
- (void)showHUDWorking;
//通用loading 内容可以点击
- (void)showTouchHUDWorking;

- (void)hideHUD;
- (void)hideHUDAtOnce;


@end

@interface UIViewController (AGAlert)
- (void)showNotWiFiAlertViewWhenNeededCompletionBlock:(void(^)(BOOL shouldContinue))block;
@end

