//
//  YYADViewController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/27.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYADViewController.h"

#define YYScreenH [UIScreen mainScreen].bounds.size.height
#define YYScreenW [UIScreen mainScreen].bounds.size.width

#define iphone4  (YYScreenH == 480)
#define iphone5  (YYScreenH == 568)
#define iphone6  (YYScreenH == 667)
#define iphone6P (YYScreenH == 736)

@interface YYADViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@end

@implementation YYADViewController

- (void)viewDidLoad{
    
    //屏幕适配,
    if (iphone4) {
        self.backImage.image = [UIImage imageNamed:@"LaunchImage-700"];
    }else if (iphone5) {
        self.backImage.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    }else if (iphone6) {
        self.backImage.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (iphone6P) {
        self.backImage.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    };
}


@end
