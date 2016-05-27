//
//  YYNavigationController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYNavigationController.h"
#import "UIImage+Render.h"

@interface YYNavigationController ()

@end

@implementation YYNavigationController

+(void)load{
    [super load];
    
    UINavigationBar *Bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //设置字体
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    Bar.titleTextAttributes = attr;
}


+(instancetype)navigationWithRoot:(NSString *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    
    Class obj = NSClassFromString(controller);
    id vc = [[obj alloc]init];
    
    YYNavigationController *navC = [[self alloc] initWithRootViewController:(UIViewController *)vc];
    
    navC.tabBarItem.title = title;
    
    navC.tabBarItem.image = [UIImage imageNameWithOriginal:image];
    
    navC.tabBarItem.selectedImage = [UIImage imageNameWithOriginal:selectImage];
    
    return navC;
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0 ) {

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        btn.backgroundColor = [UIColor blueColor];

        [btn sizeToFit];
        
//        UIView *view = [[UIView alloc]initWithFrame:btn.bounds];
//        [view addSubview:btn];
//        view.backgroundColor = [UIColor orangeColor];
        
        [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popToRootViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    //设置字体
//    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
//    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:25];
//    self.navigationBar.titleTextAttributes = attr;
    
}

@end
