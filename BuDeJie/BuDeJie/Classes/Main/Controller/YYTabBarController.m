//
//  YYTabBar.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/25.
//  Copyright © 2016年 yy. All rights reserved.
//

//navigation
#import "YYNavigationController.h"
//精华
#import "YYEssenceViewController.h"
//关注
#import "YYFriendTrendViewController.h"
//我
#import "YYMeViewController.h"
//发布
#import "YYPublishViewController.h"
//新帖
#import "YYNewViewController.h"

#import "YYTabBarController.h"

#import "YYTabBar.h"

#import "YYTempVC.h"

@implementation YYTabBarController

//-(instancetype)init{}

+(void)load{
    
    UITabBarItem *item;
    
    if ([UITabBarItem respondsToSelector:@selector(appearanceWhenContainedIn:)]) {
        item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    } else {
        item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    }
    
    //设置字体
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    YYTempVC *vc = [[YYTempVC alloc]init];
    vc.view.backgroundColor = [UIColor grayColor];
    //bar
    YYTabBar *bar = [[YYTabBar alloc]init];
    bar.modalBlock = ^(void){
        [self presentViewController:vc animated:YES completion:nil];
    };
    [self setValue:bar forKey:@"tabBar"];
    
    //精华
    YYNavigationController *essence = [YYNavigationController navigationWithRoot:NSStringFromClass([YYEssenceViewController class]) title:@"精华" image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    [self addChildViewController:essence];
    
    //新帖
    YYNavigationController *new = [YYNavigationController navigationWithRoot:NSStringFromClass([YYNewViewController class]) title:@"新帖" image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    [self addChildViewController:new];
    
    //发布
//    YYNavigationController *publish = [YYNavigationController navigationWithRoot:NSStringFromClass([YYPublishViewController class]) title:@"" image:@"tabBar_publish_icon" selectImage:@"tabBar_publish_click_icon"];
//    [self addChildViewController:publish];
    
    //关注
    YYNavigationController *friendTrend = [YYNavigationController navigationWithRoot:NSStringFromClass([YYFriendTrendViewController class]) title:@"关注" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    [self addChildViewController:friendTrend];
    
    //我
    YYNavigationController *me = [YYNavigationController navigationWithRoot:NSStringFromClass([YYMeViewController class]) storyboardName:NSStringFromClass([YYMeViewController class]) title:@"我" image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];
    
//    YYNavigationController *me = [YYNavigationController navigationWithRoot:NSStringFromClass([YYMeViewController class]) title:@"我" image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];
    [self addChildViewController:me];
    
}



@end
