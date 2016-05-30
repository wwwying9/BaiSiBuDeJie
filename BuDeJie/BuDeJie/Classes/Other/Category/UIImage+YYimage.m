//
//  UIImage+image.m
//  03-带有边框的图片裁剪
//
//  Created by apple on 20/3/21.
//  Copyright © 2020年 弓虽_子. All rights reserved.
//

#import "UIImage+YYimage.h"

@implementation UIImage (image)

// borderW 为0 , borderColor 为白色的时候有抗锯齿效果?

+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)borderColor image:(UIImage *)image{
    
    
    //0.设置边框宽度
    
    //1.加载图片
    
    //3.开启一个位图上下文
    CGSize size = CGSizeMake(image.size.width , image.size.height );
    UIGraphicsBeginImageContext(size);
    //4.绘制一个大圆0
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    //5.设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width - 2 * borderW, image.size.height - 2 * borderW)];
    //6.把路径设置成裁剪区域
    [clipPath addClip];
    
    //7.把图片绘制到上下文当中
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    
    //8.从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //9.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
    
}

// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    //设置图片的圆角半径
//    theImage.layer.cornerRadius = theImage.frame.size.width * 0.01;
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}



@end
