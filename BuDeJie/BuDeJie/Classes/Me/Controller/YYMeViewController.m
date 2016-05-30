//
//  YYMeViewController.m
//  BuDeJie
//
//  Created by 姚英 on 16/5/25.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYMeViewController.h"
#import "UIBarButtonItem+YYItem.h"
#import "YYSettingVC.h"
#import "YYHttpTool.h"
#import "YYMeModel.h"
#import <MJExtension.h>
#import "YYMeCollectionCell.h"

@interface YYMeViewController ()<UICollectionViewDataSource , UICollectionViewDelegate>

/// collectionView
@property(nonatomic, weak) UICollectionView *collectionView;

/// data
@property(nonatomic, strong) NSArray *dataArray;

@end

@implementation YYMeViewController

static NSString * const cellID = @"cell";
static const NSInteger count = 4;
static CGFloat cellW;
static const CGFloat spacing = 1;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor grayColor];
    
    
    self.tableView.tableFooterView = [self footerView];
    
    self.navigationItem.title = @"我的";
    [self setNavigation];
    
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YYMeCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:cellID];

    //loadData
    [self loadData];
}

- (void)loadData{
    
    //http://api.budejie.com/api/api_open.php topic /Users/yaoying/Desktop/百思不得姐
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"square";
    dict[@"c"] = @"topic";
    
    [YYHttpTool get:@"http://api.budejie.com/api/api_open.php" params:dict success:^(NSDictionary *responseObj) {
        
        [responseObj writeToFile:@"/Users/yaoying/Desktop/百思不得姐/me.plist" atomically:YES];
        NSArray *tempArray = responseObj[@"square_list"];
        self.dataArray = [YYMeModel mj_objectArrayWithKeyValuesArray:tempArray];
//        NSLog(@"modle = %@", )
        
        [self.collectionView reloadData];
        
        //计算高度
        NSInteger hang = (self.dataArray.count - 1) / count + 1 ;
        CGFloat h = hang * (cellW + spacing) - spacing;
        
        self.collectionView.xmg_height = h;
        self.tableView.tableFooterView = self.collectionView;
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}

- (UIView *)footerView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    cellW = (YYScreenW - (spacing * (count - 1))) / count;
//    CGFloat cellH = cellW;
    
    layout.minimumLineSpacing = spacing;
    layout.minimumInteritemSpacing = spacing;
    layout.itemSize = CGSizeMake(cellW, cellW);
    
    
    UICollectionView *view = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    view.backgroundColor = [UIColor grayColor];
    
    view.delegate = self;
    view.dataSource = self;
    
    self.collectionView = view;
    
    return view;
}

-(void)setNavigation{
    
    UIBarButtonItem *setting = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting:)];
    
//    self.navigationItem.rightBarButtonItem = setting;
    UIBarButtonItem *moon = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] seleImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moon:)];
    
    self.navigationItem.rightBarButtonItems = @[setting, moon];
}


#pragma mark - button点击方法
- (void)setting:(UIButton *)btn{
    YYFunc;
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:NSStringFromClass([YYSettingVC class]) bundle:nil];
    YYSettingVC *vc = [sb instantiateInitialViewController];
    
//    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)moon:(UIButton *)btn{
    btn.selected = !btn.selected;

    YYFunc;
}

#pragma mark -  collectionView delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YYMeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];

//    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    cell.dataModel = self.dataArray[indexPath.row];

    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


@end
