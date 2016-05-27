//
//  YYMeViewController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/25.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYMeViewController.h"
#import "UIBarButtonItem+YYItem.h"
#import "YYSettingVC.h"

@interface YYMeViewController ()

@end

@implementation YYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我的";
    [self setNavigation];
    
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}

-(void)setNavigation{
    
    UIBarButtonItem *setting = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting:)];
    
//    self.navigationItem.rightBarButtonItem = setting;
    UIBarButtonItem *moon = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] seleImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moon:)];
    
    self.navigationItem.rightBarButtonItems = @[setting, moon];
}


#pragma mark - button点击方法
- (void)setting:(UIButton *)btn{
    YYFunc;
    
    YYSettingVC *vc = [[YYSettingVC alloc]init];
    vc.view.backgroundColor = [UIColor orangeColor];
    
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)moon:(UIButton *)btn{
    btn.selected = !btn.selected;
    YYFunc;
}

@end
