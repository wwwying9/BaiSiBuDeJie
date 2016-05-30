//
//  UIImage+image.h
//  03-带有边框的图片裁剪
//
//  Created by apple on 20/3/21.
//  Copyright © 2020年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)borderColor image:(UIImage *)image;


// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
