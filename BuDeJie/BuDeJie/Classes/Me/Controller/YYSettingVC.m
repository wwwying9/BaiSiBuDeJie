//
//  YYSettingVC.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/27.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYSettingVC.h"

@interface YYSettingVC () <UIGestureRecognizerDelegate>

@end

@implementation YYSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"interactivePopGestureRecognizer = %@",self.navigationController.interactivePopGestureRecognizer);
    NSLog(@"delegate = %@",self.navigationController.interactivePopGestureRecognizer.delegate);
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
