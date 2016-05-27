//
//  YYTempVC.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/27.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYTempVC.h"

@implementation YYTempVC

- (void)viewDidLoad {
    UIButton *btn = [[UIButton  alloc] initWithFrame:self.view.bounds];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)back{
    YYFunc;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
