//
//  YYNavigationController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYNavigationController.h"
#import "UIImage+Render.h"

@interface YYNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation YYNavigationController

+(void)load{
    [super load];
    
    UINavigationBar *Bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //设置字体
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    Bar.titleTextAttributes = attr;
    
//    [Bar setBackIndicatorImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"]];
    [Bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
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

        [btn sizeToFit];
        
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
    
    //通过打印手势得到action.
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    
     pan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
    
    
    /*
     //    NSLog(@"%@",self.interactivePopGestureRecognizer);
     2016-05-27 22:45:19.246 BuDeJie[1955:84395] <UIScreenEdgePanGestureRecognizer: 0x7ff968f8d200; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7ff968e39530>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff968f8cc20>)>>
     */
}

// 不实现这个代理方法会发生假死状态
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
}

@end
