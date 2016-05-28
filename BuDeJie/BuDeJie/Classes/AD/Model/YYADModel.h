//
//  YYADModel.h
//  BuDeJie
//
//  Created by 姚英 on 16/5/28.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYADModel : NSObject
//ori_curl 连接地址 w_picurl 图片地址 w h
/// 连接地址
@property(nonatomic, strong) NSString *ori_curl;
/// 图片地址
@property(nonatomic, strong) NSString *w_picurl;

@property(nonatomic, assign) NSInteger w;

@property(nonatomic, assign) NSInteger h;
@end
