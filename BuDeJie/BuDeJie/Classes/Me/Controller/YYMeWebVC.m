//
//  YYMeWebVC.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/31.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYMeWebVC.h"
#import <WebKit/WebKit.h>

@interface YYMeWebVC ()

/// <#annotate#>
@property(nonatomic, weak) WKWebView *webView;
@end

@implementation YYMeWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.
    
    if (self.url != nil) {
        
        WKWebView *wk = [[WKWebView alloc]initWithFrame:self.view.bounds];
         _webView = wk;
        [self.view addSubview:wk];
        NSURL *url = [NSURL URLWithString:self.url];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [wk loadRequest:request];
    }
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
