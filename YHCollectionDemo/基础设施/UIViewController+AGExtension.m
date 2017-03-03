//
//  UIViewController+AGExtension.m
//  LittleGame
//
//  Created by Mao on 14-8-25.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import "UIViewController+AGExtension.h"
#import "UIButton+AGExtension.h"
#import "UIView+BlocksKit.h"
#import "AGLoadingView.h"
static NSTimeInterval DefaultDelay = 2;

@implementation UIViewController (AGTools)
- (UIViewController *)ag_fatherViewController
{
    UIViewController *viewController = (UIViewController *)self.nextResponder;
    while (![viewController isKindOfClass:[UIViewController class]]) {
        viewController = (UIViewController *)viewController.nextResponder;
    }
    return viewController;
}
+ (UIViewController *)ag_currentViewController{
    UIView *aView = [UIApplication sharedApplication].windows.firstObject;
    NSMutableArray *views = [NSMutableArray arrayWithArray:aView.subviews];
    while (views.count) {
        UIView *each = views.firstObject;
        if ([each.nextResponder isKindOfClass:[UIViewController class]]) {
            UIViewController *aVC = (UIViewController*)each.nextResponder;
            return aVC;
        }else{
            [views removeObjectAtIndex:0];
            [views addObjectsFromArray:each.subviews];
        }
    }
    return nil;
    
}
+ (UIViewController *)ag_rootController{
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}
+ (UINavigationController*)ag_currentNavigationController{
    UIView *aView = [UIApplication sharedApplication].windows.firstObject;
    NSMutableArray *views = [NSMutableArray arrayWithArray:aView.subviews];
    while (views.count) {
        UIView *each = views.firstObject;
        if ([each.nextResponder isKindOfClass:[UINavigationController class]]) {
            UINavigationController *aVC = (UINavigationController*)each.nextResponder;
            return aVC;
        }else{
            [views removeObjectAtIndex:0];
            [views addObjectsFromArray:each.subviews];
        }
    }
    return nil;
}

+ (UIViewController*)ag_findFirstViewControllerOnDisplayingWithClass:(Class)aClass{
    UIWindow *aWindow = [UIApplication sharedApplication].windows.firstObject;
    NSMutableArray *views = [aWindow.subviews mutableCopy];
    while (views.count) {
        UIView *aView = views.firstObject;
        [views removeObjectAtIndex:0];
        if ([[aView nextResponder] isKindOfClass:aClass]) {
            return (UIViewController*)[aView nextResponder];
        }else{
            [views addObjectsFromArray:aView.subviews];
        }
    }
    return nil;
}
@end

@implementation UIViewController (AGHUD)

- (void)showHUDWithInfo:(NSString*)info{
    [self showHUDWithInfo:info hideAfterDelay:DefaultDelay];
}
- (void)showHUDWithInfo:(NSString*)info completionBlock:(void(^)())block{
    [self showHUDWithInfo:info hideAfterDelay:DefaultDelay completionBlock:block];
}
- (void)showHUDWithInfo:(NSString*)info hideAfterDelay:(NSTimeInterval)delay{
    [self showHUDWithInfo:info hideAfterDelay:delay completionBlock:nil];
}
- (void)showHUDWithInfo:(NSString*)info hideAfterDelay:(NSTimeInterval)delay completionBlock:(void(^)())block{
    [self showHUDWithTitle:@"" info:info hideAfterDelay:delay completionBlock:block];
}
- (void)showHUDWithTitle:(NSString*)title info:(NSString*)info hideAfterDelay:(NSTimeInterval)delay completionBlock:(void(^)())block{
    MBProgressHUD *hud = [self hud];
    hud.color = [UIColor blackColor];
    hud.bezelView.color=[UIColor blackColor];
    hud.bezelView.style=MBProgressHUDBackgroundStyleSolidColor;
    hud.label.font = [UIFont systemFontOfSize:AGValueMultiRatio(14)];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelFont = [UIFont systemFontOfSize:AGValueMultiRatio(14)];
    hud.labelText = title;
    hud.detailsLabelText = info;
    hud.detailsLabel.textColor = [UIColor whiteColor];
    [hud hide:YES afterDelay:delay];
    hud.completionBlock = block;
}

- (void)showHUDWorking{
    
    [self showHUDWorkingWithTouch:NO];
}

-(void)showTouchHUDWorking{
    [self showHUDWorkingWithTouch:YES];
}

-(void)showHUDWorkingWithTouch:(BOOL)isTouch{
    MBProgressHUD *hud = [self hud];
    if (!self.navigationController) {
    
            CGRect  frame = hud.frame;
            frame.origin.y = AGValueMultiRatio(64);
            frame.size.height =  frame.size.height -AGValueMultiRatio(64);
            hud.frame = frame;
    }
    hud.userInteractionEnabled = !isTouch;
    AGLoadingView * loadingView= [[AGLoadingView alloc]initWithStyle:AGLoadingDefaultStyle Info:nil];
    hud.minSize=loadingView.frame.size;
    hud.bezelView.color=[UIColor clearColor];
    hud.bezelView.style=MBProgressHUDBackgroundStyleSolidColor;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView=loadingView;
    [loadingView startAnimation];
    hud.labelText = nil;
    hud.detailsLabelText = nil;
}


- (void)hideHUD{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (hud.customView&&hud.mode==MBProgressHUDModeCustomView) {
        AGLoadingView * loadingView=(AGLoadingView*)hud.customView;
        if (loadingView) {
            [loadingView stopAnimation];
        }
    }
    [hud hide:YES];
}

- (void)hideHUDAtOnce{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    [hud hide:NO];
}

- (MBProgressHUD*)hud{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    return hud;
}
@end


@implementation UIViewController (AgAlert)

- (void)showNotWiFiAlertViewWhenNeededCompletionBlock:(void(^)(BOOL shouldContinue))block{
    if (![[[PINMemoryCache sharedCache] objectForKey:@"com.appgame.i_konw_not_wifi"] boolValue]) {
//        if ([[AFNetworkReachabilityManager sharedManager] isReachableViaWWAN]) {
//            PSTAlertController *controller = [PSTAlertController actionSheetWithTitle:@"你可能在使用网络运营商的流量"];
//            [controller addAction:[PSTAlertAction actionWithTitle:@"继续" style:PSTAlertActionStyleDefault handler:^(PSTAlertAction * _Nonnull action) {
//                [[PINMemoryCache sharedCache] setObject:@(YES) forKey:@"com.appgame.i_konw_not_wifi"];
//                block?block(YES):nil;
//            }]];
//            [controller addAction:[PSTAlertAction actionWithTitle:@"取消" style:PSTAlertActionStyleCancel handler:^(PSTAlertAction * _Nonnull action) {
//                block?block(NO):nil;
//            }]];
//            [controller showWithSender:nil arrowDirection:UIPopoverArrowDirectionAny controller:self animated:YES completion:nil];
//        }else{
//            block?block(YES):nil;
//        }
    }else{
        if (block) {
            block(YES);
        }
    }
}

@end

