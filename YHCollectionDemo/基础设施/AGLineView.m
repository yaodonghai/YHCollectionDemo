//
//  AGLineView.m
//  AGVideo
//
//  Created by Mao on 16/6/8.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "AGLineView.h"

@implementation AGLineView{
    UIView *_line;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.lineWidth = [AGUtilities onePixelHeight];
    _line = [[UIView alloc] init];
    [self insertSubview:_line atIndex:0];
    _line.el_centreToSuperView(CGPointZero);
    if (!self.lineColor) {
        self.lineColor = [UIColor whiteColor];
    }
}

- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    _line.backgroundColor = lineColor;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (void)layoutSubviews{
    if (_line) {
        [_line removeConstraints:_line.constraints];
        if (self.width > self.height) {
            _line.el_toHeight(self.lineWidth).el_toWidth(self.width);
        }else{
            _line.el_toHeight(self.height).el_toWidth(self.lineWidth);
        }
    }
    [super layoutSubviews];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end
