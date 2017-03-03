//
//  AGLineView.h
//  AGVideo
//
//  Created by Mao on 16/6/8.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  白线视图。长>宽为横线，反之竖线
 */
@interface AGLineView : UIView
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
@property (nonatomic, assign) IBInspectable UIColor* lineColor;
@end
