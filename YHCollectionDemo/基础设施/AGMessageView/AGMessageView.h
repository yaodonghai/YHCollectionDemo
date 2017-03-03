//
//  AGMessageView.h
//  MonkeyKingTV
//
//  Created by 姚东海 on 16/7/13.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AGMessageViewType) {
    AGMessageViewTypeMessage = 0,			// 信息
    AGMessageViewTypeSuccess,				// 成功
    AGMessageViewTypeError,					// 错误
    AGMessageViewTypeWarning,				// 警告
    AGMessageViewTypeCustom					// 自定义
};

typedef NS_ENUM(NSInteger, AGMessagePosition) {
    AGMessagePositionTop = 0,
    JRMessagePositionBottom
};

@interface AGMessageView : UIView

@property (nonatomic, strong) void (^tapBlock)(void);

- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                      iconUrl:(NSString *)icon
                  messageType:(AGMessageViewType)type
              messagePosition:(AGMessagePosition)position
                     duration:(CGFloat)duration;
- (void)showMessageView;

@end
