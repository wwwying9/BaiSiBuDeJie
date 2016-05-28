//
//  YYADViewController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/27.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYADViewController.h"
#import "YYTabBarController.h"

#define YYScreenH [UIScreen mainScreen].bounds.size.height
#define YYScreenW [UIScreen mainScreen].bounds.size.width

#define iphone4  (YYScreenH == 480)
#define iphone5  (YYScreenH == 568)
#define iphone6  (YYScreenH == 667)
#define iphone6P (YYScreenH == 736)

@interface YYADViewController ()
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@property (weak, nonatomic) IBOutlet UIImageView *backImage;

/// 返回倒计时
@property(nonatomic, weak) NSTimer *timer;
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
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(jump) userInfo:nil repeats:YES];
    
    

}

- (IBAction)jumpBtnClick:(UIButton *)sender {

    [_timer invalidate];
    
    YYTabBarController *bar = [[YYTabBarController alloc]init];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = bar;
    
}


- (void)jump{
    
    static int i = 2;
    if (i < 0) {
        [self jumpBtnClick:nil];
    }
    _jumpBtn.titleLabel.text = [NSString stringWithFormat:@"跳过 (%is)",i];
    i --;
    
}

@end
