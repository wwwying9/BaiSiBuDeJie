//
//  YYEssenceViewController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/25.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYEssenceViewController.h"
#import "UIBarButtonItem+YYItem.h"
#import "YYAllViewController.h"
#import "YYPictureViewController.h"
#import "YYVideoViewController.h"
#import "YYWordViewController.h"

@interface YYEssenceViewController () <UIScrollViewDelegate>
/// scroll
@property(nonatomic, weak) UIScrollView *scrollView;


@end

@implementation YYEssenceViewController

#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置导航栏
    [self setupNavBar];
    // ChildViewController
    [self setupChildViewController];
    // scrollView
    [self setupScrollView];
}

- (void)setupChildViewController{
    
    [self addChildViewController:[[YYAllViewController alloc]init]];
    [self addChildViewController:[[YYPictureViewController alloc]init]];
    [self addChildViewController:[[YYVideoViewController alloc]init]];
    [self addChildViewController:[[YYWordViewController alloc]init]];
}

/// 设置导航栏
- (void)setupNavBar{
    self.navigationItem.title = @"精华";
    self.view.backgroundColor = [UIColor purpleColor];
    
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(rand)];
    //中间
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)setupScrollView{
    
    NSInteger count = self.childViewControllers.count;
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
//    scroll.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    self.automaticallyAdjustsScrollViewInsets = NO;

    scroll.backgroundColor = [UIColor blueColor];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.delegate = self;
    // 点击状态栏时,这个scrollView不需要滚动到顶部
    scroll.scrollsToTop = NO;
    // 其他设置
    scroll.contentSize = CGSizeMake(count * scroll.xmg_width, 0);
    YYLog(@"%@", NSStringFromCGSize(scroll.contentSize));
    scroll.pagingEnabled = YES;
    
    _scrollView = scroll;
    [self.view addSubview:scroll];
    
    
    //test
    
    for (int i = 0 ; i < count; i++) {
        UIView *view = [self.childViewControllers[i] view];
        view.frame = CGRectMake(i * self.view.xmg_width, 0, self.view.xmg_width, self.view.xmg_height);
        [self.scrollView addSubview:view];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    YYFunc;
    
}


- (void)game{
    
}

- (void)rand{
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    YYLog(@"frame = %@",NSStringFromCGRect(self.scrollView.frame));
}

@end
