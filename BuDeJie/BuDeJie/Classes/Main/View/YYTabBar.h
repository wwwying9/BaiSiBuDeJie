//
//  YYTabBar.h
//  BuDeJie
//
//  Created by 姚英 on 16/5/26.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^YYmodalBlock)(void);
@interface YYTabBar : UITabBar

/// <#annotate#>
@property(nonatomic, copy) YYmodalBlock  modalBlock;

@end
