//
//  AppearanceService.m
//  LittleGame
//
//  Created by Mao on 14-8-22.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import "AGAppearanceService.h"
#import "UIColor+AGExtension.h"
#import "AGUtilities.h"
@implementation AGAppearanceService

+ (void)setDefaultAppearanceSetting{
    [[UINavigationBar appearance] setTintColor:[UIColor ag_G1]];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor ag_W1],
                                                           NSFontAttributeName : [UIFont ag_mediumFontOfSize:17],
                                                           }];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] andSize:CGSizeMake(4, 4)] forBarMetrics:UIBarMetricsDefault];

    UIImage *backButtonImage = [[UIImage imageNamed:@"commond_btn_back"] imageWithOriginalRenderingMode];
    [[UIBarButtonItem  appearance] setBackButtonBackgroundImage:[backButtonImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonImage.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    if (IOS9_OR_LATER) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    }else{
        [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    }
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor ag_G1] andSize:CGSizeMake([AGUtilities screenWidth], 1)]];
    UIButton *btn = [UIButton appearanceWhenContainedIn:[UIActionSheet class], nil];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTintColor:[UIColor whiteColor]];
}
@end

@implementation UIColor (AGAppearance)


+ (UIColor*)ag_B1{
    return [UIColor HEX:0x0095fe];
}
+ (UIColor*)ag_B2{
    return [UIColor HEX:0x787878];
}
+ (UIColor*)ag_B3{
    return [UIColor HEX:0xa0a1a5];
}


+ (UIColor*)ag_G0{
    return [UIColor HEX:0x2a3070];
}
+ (UIColor*)ag_G1{
    return [UIColor HEX:0x1b1b1b];
}
+ (UIColor*)ag_G2{
    return [UIColor HEX:0x787878];
}
+ (UIColor*)ag_G3{
    return [UIColor HEX:0xa0a1a5];
}
+ (UIColor*)ag_G4{
    return [UIColor HEX:0xf5f5f5];
}
+ (UIColor*)ag_G5{
    return [UIColor HEX:0x545454];
}
+ (UIColor*)ag_G6{
    return [UIColor HEX:0xdfdfdf];
}
+ (UIColor*)ag_G7{
    return [UIColor HEX:0xe2e6f3];
}

+ (UIColor*)ag_P1{
    return [UIColor HEX:0xfe9494];
}
+ (UIColor*)ag_P2{
    return [UIColor HEX:0x9aa9e4];
}

+ (UIColor*)ag_R1{
    return [UIColor HEX:0xfe4d67];
}

+ (UIColor*)ag_W1{
    return [UIColor HEX:0xffffff];
}

+ (UIColor*)ag_Y1{
    
    return [UIColor HEX:0xfed100];
}

+ (UIColor*)ag_Y2{
    return [UIColor HEX:0xfec200];
}

+ (UIColor*)ag_Y3{
    return [UIColor HEX:0xfead00];
}

+ (UIColor*)ag_Y4{
    return [UIColor HEX:0xfeef35];
}

+ (UIColor*)ag_O1{
    return [UIColor HEX:0xff5a26];
}

@end

@implementation UIFont (AGAppearance)

+ (UIFont*)ag_lightFontOfSize:(NSInteger)size{
    return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
}
+ (UIFont*)ag_regularFontOfSize:(NSInteger)size{
    return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
}
+ (UIFont*)ag_mediumFontOfSize:(NSInteger)size{
    return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
}

+ (UIFont*)ag_boldFontOfSize:(NSInteger)size{
    return [UIFont systemFontOfSize:size weight:UIFontWeightBold];
}

@end
