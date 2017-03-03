//
//  AGLoadingView.m
//  MonkeyKingTV
//
//  Created by yaodonghai on 16/8/31.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "AGLoadingView.h"
@interface AGLoadingView(){
    UIImageView  * _animationImageView;
}
@property (nonatomic, strong) UIImageView  * animationImageView;
@property (nonatomic, strong) UILabel  * infoLabel;
@property (nonatomic , assign) AGLoadingStyle style;
@property (nonatomic , strong) NSString * info;

@end
@implementation AGLoadingView


-(instancetype)initWithStyle:(AGLoadingStyle)style Info:(NSString*)info{
    _style = style;
    _info = info;
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}


+(NSArray*)animationImagesWithImageName:(NSString*)name{
    NSMutableArray * animations = [NSMutableArray arrayWithCapacity:12];
    for (int i=1; i<=12; i++) {
        [animations addObject: [UIImage imageNamed:[NSString stringWithFormat:@"%@%d",name,i]]];
    }
    return animations;
}


-(void)setupUI{
    
    self.backgroundColor=[UIColor clearColor];
    self.animationImageView = [UIImageView new];
    self.animationImageView.animationDuration=1.0;
    self.animationImageView.animationRepeatCount=0;
    
    NSString * imageName = @"common_loading_";
    if (self.style==AGLoadingLiveStyle) {
        imageName = @"loading_live_";
    }
    
    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@1",imageName]];
    CGRect frame  = CGRectMake(0, 0, image.size.width, image.size.height);

    self.animationImageView.animationImages=[AGLoadingView animationImagesWithImageName:imageName];
    [self addSubview:_animationImageView];
    
    if (_info.length) {
        self.animationImageView.el_axisXToSuperView(0).el_topToSuperView(-image.size.height).el_toSize(image.size);

        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineHeightMultiple = 1.4f;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSMutableAttributedString * infoAttributedString = [[NSMutableAttributedString alloc] initWithString: _info];
       
        
        NSDictionary * attributes = @{
                                      NSBaselineOffsetAttributeName:@(0),
                                      NSFontAttributeName:[UIFont ag_mediumFontOfSize:AGValueMultiRatio(16)],
                                      NSForegroundColorAttributeName: [UIColor whiteColor],
                                      NSParagraphStyleAttributeName:paragraphStyle,
                                      NSBaselineOffsetAttributeName:@(0)
                                      };
        
        [infoAttributedString addAttributes:attributes range:NSMakeRange(0, _info.length)];
        
        CGSize infoSize = [infoAttributedString boundingRectWithSize:CGSizeMake(image.size.width+AGValueMultiRatio(50), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        infoSize.height =  infoSize.height +AGValueMultiRatio(2);
        frame = CGRectMake(0, 0,infoSize.width ,image.size.height+infoSize.height);
        
        self.infoLabel = [UILabel new];
        self.infoLabel.numberOfLines = 0;
        self.infoLabel.textAlignment = NSTextAlignmentCenter;
        self.infoLabel.backgroundColor =  [UIColor clearColor];
        [self addSubview:self.infoLabel];
        self.infoLabel.attributedText = infoAttributedString;

        self.infoLabel.el_bottomToSuperView(-(infoSize.height-AGValueMultiRatio(1))).el_toSize(infoSize).el_axisXToSuperView(0);
        
        

    }else{
        self.animationImageView.el_axisXToSuperView(0).el_axisYToSuperView(0);

    }
    self.frame = frame;

}

-(void)stopAnimation{
   
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha=0.0;
    } completion:^(BOOL finished) {
        if (self.animationImageView.animationImages.count&&self.animationImageView.isAnimating) {
            [self.animationImageView stopAnimating];
        }
        [self removeFromSuperview];

    }];
}


-(void)startAnimation{

    if (self.animationImageView.animationImages.count&&!self.animationImageView.isAnimating) {
        [self.animationImageView startAnimating];
    }
}

@end
