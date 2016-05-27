//
//  YYTabBar.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYTabBar.h"

@interface YYTabBar ()

/// <#annotate#>
@property(nonatomic, weak) UIButton *publishBtn;
@end


@implementation YYTabBar


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp{
//    [UITabBar appearanceForTraitCollection];
    self.tintColor = [UIColor blackColor];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger count = self.items.count + 1;
    
//    CGRect frame = [[UIScreen mainScreen] bounds];
    CGRect frame = self.frame;
    
    CGFloat barX = 0;
    CGFloat barY = 0;
    CGFloat barW = frame.size.width / count ;
    CGFloat barH = self.frame.size.height;
    NSInteger i = 0;
    
//    NSLog(@"%@ \n\n",self.subviews);
    
    for (UIView *obj in self.subviews) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i++ ;
            }
            barX = barW * i;
            obj.frame = CGRectMake(barX, barY, barW, barH);
            i++;
        }
    }
    
    self.publishBtn.frame = CGRectMake(barW * 2, 0, barW, barH);
//    self.publishBtn.center = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
}

-(UIButton *)publishBtn{
    if(_publishBtn == nil){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(modal) forControlEvents:UIControlEventTouchUpInside];
        
        [btn sizeToFit];
        [self addSubview:btn];
        _publishBtn = btn;
    }
    return _publishBtn;
}

- (void)modal{
    YYFunc;
    self.modalBlock();
}

@end
