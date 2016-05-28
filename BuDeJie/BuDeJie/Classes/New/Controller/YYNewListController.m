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

@interface YYNewListController ()

/// <#annotate#>
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation YYNewListController

static NSString  * const cellID = @"list";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"YYNewListCell" bundle:nil]  forCellReuseIdentifier:cellID];
    
    
    //发送请求
    NSString *url = @"http://api.budejie.com/api/api_open.php";
    
    // a, c, action
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"tag_recommend";
    dict[@"c"] = @"topic";
    dict[@"action"] = @"sub";
    
    [YYHttpTool get:url params:dict success:^(NSDictionary *responseObj) {
        
//        [responseObj writeToFile:@"/Users/yaoying/Desktop/百思不得姐/list.plist" atomically:YES];
//        NSLog(@"%@",responseObj);
        self.dataArray = [YYNewListModel mj_objectArrayWithKeyValuesArray:responseObj];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYNewListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.data = self.dataArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

@end
