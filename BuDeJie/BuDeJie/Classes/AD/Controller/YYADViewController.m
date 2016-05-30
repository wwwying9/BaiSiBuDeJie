//
//  YYADViewController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/27.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYADViewController.h"
#import "YYTabBarController.h"
#import <MJExtension.h>
//#import <AFNetworking.h>
#import "YYHttpTool.h"
#import "YYADModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define XMGCode2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"


@interface YYADViewController ()
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@property (weak, nonatomic) IBOutlet UIImageView *backImage;
//@property (weak, nonatomic) IBOutlet UIImageView *ADImage;
@property (weak, nonatomic) IBOutlet UIView *content;

/// 返回倒计时
@property(nonatomic, weak) NSTimer *timer;
/// <#annotate#>
@property(nonatomic, strong) YYADModel *ADModel;

/// AD image
@property(nonatomic, weak) UIImageView *ADImage;
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

    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //ori_curl 连接地址 w_picurl 图片地址 w h
    
    // 2.创建请求参数:字典
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = XMGCode2;
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/javascript", nil];
    
    // 3.发送请求(get,post)
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
       
        responseObject = [responseObject[@"ad"] lastObject];
        _ADModel = [YYADModel mj_objectWithKeyValues:responseObject];
//        NSLog(@"%@",ADModel.w_picurl);
        
        if (_ADModel.w == 0) return ;
        if (_ADModel.h == 0) return ;
        
//        if (_ADModel.w / _ADModel.h ) {
//            statements
//        }
//        CGFloat h = YYScreenW / _ADModel.w * _ADModel.h;
        
        CGFloat h = YYScreenW * _ADModel.h / _ADModel.w;
        CGFloat w = YYScreenW;
        
        
        self.ADImage.frame = CGRectMake(0, 0, w,h );

//        [self.ADImage sd_setImageWithURL:[NSURL URLWithString:_ADModel.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"err = %@",error);
    }];
    
    

}

- (IBAction)jumpBtnClick:(UIButton *)sender {

    [_timer invalidate];
    
    YYTabBarController *bar = [[YYTabBarController alloc]init];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = bar;
    
}


- (void)jump{
    
    static int i = 1;
    if (i < 0) {
        [self jumpBtnClick:nil];
    }
    _jumpBtn.titleLabel.text = [NSString stringWithFormat:@"跳过 (%is)",i];
    i --;
    
}

#pragma mark - 点按手势

- (void)tap{
    UIApplication *app = [UIApplication sharedApplication];
    NSLog(@"url = %@",self.ADModel.ori_curl);
    if ([app canOpenURL:[NSURL URLWithString:self.ADModel.ori_curl]]) {
        [app  openURL:[NSURL URLWithString:self.ADModel.ori_curl]];
    }
//    [self.ADModel.ori_curl;]
}

#pragma mark - 懒加载

-(UIImageView *)ADImage{
    if(_ADImage == nil){
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [self.content addSubview:imageView];
        
        imageView.userInteractionEnabled = YES;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        
        [imageView addGestureRecognizer:tap];
        
        
        _ADImage = imageView;
    }
    return _ADImage;
}

@end
