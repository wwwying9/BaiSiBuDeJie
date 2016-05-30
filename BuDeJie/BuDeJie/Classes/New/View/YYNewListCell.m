//
//  YYNewListCell.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/29.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYNewListCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+YYimage.h"
#import "YYNewListModel.h"

@interface YYNewListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *nubLable;

@end

@implementation YYNewListCell

- (void)awakeFromNib {
    // Initialization code
//    NSLog(@"%@",NSStringFromCGRect( self.iconImage.frame));
    
    self.iconImage.layer.cornerRadius = self.iconImage.frame.size.width *0.5;
    self.iconImage.layer.masksToBounds = YES;
    
    //抗锯齿 (无效?)
//    self.iconImage.layer.allowsEdgeAntialiasing = YES;
//    self.iconImage.layer.shouldRasterize = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setData:(YYNewListModel *)data{
    _data = data;
    
//    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:data.image_list] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            //[image ];
//    }];
    
    self.nubLable.text = data.sub_number;
    self.nameLable.text = data.theme_name;
    
    if (_data.image_list == nil) return;

//    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:data.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
////        image = [UIImage imageWithBorderW:0 borderColor:[UIColor whiteColor] image:image];
////        
//////        self.iconImage.layer.allowsEdgeAntialiasing = true;
//////        self.iconImage.layer.shouldRasterize = YES;
////        
//        self.iconImage.image = image;
//    }];
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:data.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
}



//- (void)

@end
