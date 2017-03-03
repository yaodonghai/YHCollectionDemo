//
//  AGLimitedTextView.h
//  AGVideo
//
//  Created by MaoRongsen on 15/12/10.
//  Copyright © 2015年 AppGame. All rights reserved.
//

#import "SZTextView.h"
typedef NS_ENUM(NSInteger, AGTextViewLimitType)
{
    InterceptionStringTextView = 0,
    TextViewUnableToEnter
};
@interface AGLimitedTextView : SZTextView<UITextViewDelegate>
@property (nonatomic) IBInspectable NSInteger maxWords;
@property (nonatomic) IBInspectable NSInteger maxLineFeed;  //最大换行符数量
@property (nonatomic, assign) AGTextViewLimitType limitType;
@end
