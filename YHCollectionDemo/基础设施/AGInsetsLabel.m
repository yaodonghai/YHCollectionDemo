//
//  AGInsetsLabel.m
//  AGVideo
//
//  Created by Mao on 16/6/6.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "AGInsetsLabel.h"

@implementation AGInsetsLabel

- (void)setEdgeInsets:(CGPoint)edgeInsets{
    _edgeInsets = edgeInsets;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    CGRect r = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    return CGRectInset(r, -_edgeInsets.x, -_edgeInsets.y);
}
@end
