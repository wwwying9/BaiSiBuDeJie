//
//  YYEssenceViewController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/25.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYEssenceViewController.h"
#import "UIBarButtonItem+YYItem.h"

@interface YYEssenceViewController ()

@end

@implementation YYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"精华";
    self.view.backgroundColor = [UIColor purpleColor];
    
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(rand)];
    //中间
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // Do any additional setup after loading the view.
}

- (void)game{
    
}

- (void)rand{
    
}

@end
