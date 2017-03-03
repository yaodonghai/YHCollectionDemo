//
//  AGLoadingView.h
//  MonkeyKingTV
//
//  Created by yaodonghai on 16/8/31.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, AGLoadingStyle){
    AGLoadingDefaultStyle        = 0,//默认样式
    AGLoadingLiveStyle     = 1    //直播间样式
};

@interface AGLoadingView : UIView
-(instancetype)initWithStyle:(AGLoadingStyle)style Info:(NSString*)info;
-(void)stopAnimation;
-(void)startAnimation;
@end
