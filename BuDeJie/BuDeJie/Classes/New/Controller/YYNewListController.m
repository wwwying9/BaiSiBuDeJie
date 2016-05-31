//
//  YYNewListController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/28.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYNewListController.h"
#import "YYHttpTool.h"
#import <MJExtension.h>
#import "YYNewListModel.h"
#import "YYNewListCell.h"
#import <SVProgressHUD.h>


@interface YYNewListController ()


@property(nonatomic, strong) NSArray *dataArray;
///网络请求
@property(nonatomic, weak) NSURLSessionDataTask *task;

@end

@implementation YYNewListController

static NSString  * const cellID = @"list";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [SVProgressHUD showInfoWithStat];
    [SVProgressHUD showWithStatus:@"加载中..." ];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//    [SVProgressHUD set]
//    [SVProgressHUD showSuccessWithStatus:@"还在加载..."];
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"YYNewListCell" bundle:nil]  forCellReuseIdentifier:cellID];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置tableView背景色
    self.tableView.backgroundColor = [UIColor grayColor];
    
    
    //发送请求
    NSString *url = @"http://api.budejie.com/api/api_open.php";
    
    // a, c, action
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"tag_recommend";
    dict[@"c"] = @"topic";
    dict[@"action"] = @"sub";
    
   self.task = [YYHttpTool get:url params:dict success:^(NSDictionary *responseObj) {
        
//        NSLog(@"%@",responseObj);
        
        [SVProgressHUD dismiss];
        
        self.dataArray = [YYNewListModel mj_objectArrayWithKeyValuesArray:responseObj];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super  viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
    
    // 取消请求
    [_task cancel];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.dataArray.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYFunc;
//    YYNewListModel *model = self.dataArray[indexPath.row];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYNewListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    //    cell.data = self.dataArray[indexPath.row];
    return cell;
}
//优化cell,数据绑定放在这里
-(void)tableView:(UITableView *)tableView willDisplayCell:(YYNewListCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.data = self.dataArray[indexPath.row];
}

@end
