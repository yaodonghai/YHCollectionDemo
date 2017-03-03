//
//  AGLimitedTextField.h
//  AGVideo
//
//  Created by MaoRongsen on 15/12/10.
//  Copyright © 2015年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, AGLimitTextFieldType){
    InterceptionString = 0,
    TextFieldUnableToEnter 
};
@interface AGLimitedTextField : UITextField<UITextFieldDelegate>
@property (nonatomic) IBInspectable NSInteger maxWords;
@property (nonatomic) IBInspectable BOOL toolBarHidden;
@property (nonatomic, assign) AGLimitTextFieldType limitType;
@end
