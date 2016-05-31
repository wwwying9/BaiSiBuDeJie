//
//  YYMeCollectionCell.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/30.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYMeCollectionCell.h"
#import "YYMeModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface YYMeCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageWidth;
@end

@implementation YYMeCollectionCell

- (void)awakeFromNib {
//    self.iconImageWidth.constant = self.iconImage.frame.size.height;
    
  //  NSLog(@"frame = %@", NSStringFromCGRect(self.iconImage.frame));
}

-(void)setDataModel:(YYMeModel *)dataModel{
    
    _dataModel = dataModel;
    
    self.nameLable.text = dataModel.name;
    
//    YYLog(@"frame = %@",NSStringFromCGRect(self.iconImage.frame));
//    YYLog(@"icon =  %@",dataModel.icon);
    
 #warning 怎么用自动布局来设置iconImage的 高度和宽度相等?
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:dataModel.icon]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat space = 5;
    CGFloat lableHeight = 20;
    CGFloat width = self.xmg_width;
    
    //计算iconWidth
    CGFloat iconWidth = width - space * 2 - lableHeight;
    self.iconImage.frame = CGRectMake((width - iconWidth) / 2, space, iconWidth, iconWidth);
    self.nameLable.frame = CGRectMake(0, CGRectGetMaxY(self.iconImage.frame) + space, width, lableHeight);

}

//- (void)

@end
