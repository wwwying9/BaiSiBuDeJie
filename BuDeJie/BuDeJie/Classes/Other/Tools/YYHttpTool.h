//
//  YYHttpTool.h
//网络请求工具类，负责整个项目中所有的Http网络请求

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define DOWNLOAD @"default"

@interface YYHttpTool : NSObject
/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
            例 :    NSDictionary *dictM =@{
                                            @"username":@"520it",
                                            @"pwd":@"520it",
                                            @"type":@"JSON"
                                         };
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params
                           success:(void(^)(id responseObj))success
                           failure:(void(^)(NSError *error))failure;

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (NSURLSessionDataTask *)post:(NSString *)url
                        params:(NSDictionary *)params
                       success:(void(^)(id responseObj))success
                       failure:(void(^)(NSError *error))failure;

/**
 *  发送download请求
 *
 *  @param url       请求路径
 *  @param progress  进度回调
 *  @param completionHandler 请求完成的时候调用
                    response:响应头信息
                    filePath==fullPath 文件的最终目录
                    error:错误信息
 * 注意:文件下载完后保存在沙盒的 /Library/Caches/default 路径中
 */
+ (NSURLSessionDownloadTask *)download:(NSString *)url
                          progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                 completionHandler:(void (^)(NSURLResponse *response, NSURL * filePath, NSError * error))completionHandler;

@end















