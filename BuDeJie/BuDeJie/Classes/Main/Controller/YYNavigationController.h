//
//  YYNavigationController.h
//  BuDeJie
//
//  Created by 姚英 on 16/5/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYNavigationController : UINavigationController

+(instancetype)navigationWithRoot:(NSString *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage;

+(instancetype)navigationWithRoot:(NSString *)controller storyboardName:(NSString *)StoryboardName title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage;

@end
