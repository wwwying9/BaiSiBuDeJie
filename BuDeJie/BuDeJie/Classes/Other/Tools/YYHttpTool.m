//
//  YYHttpTool.m
//

#import "YYHttpTool.h"
//download
#define DOWNLOAD @"default"


@implementation YYHttpTool
+(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //2.发送Get请求
    [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(NSURLSessionDataTask *)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
   NSURLSessionDataTask *dataTask = [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
       if (success) {
           success(responseObject);
       }
       
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
       if (failure) {
           failure(error);
       }
   }];
    
    return dataTask;
}

+ (NSURLSessionDownloadTask *)download:(NSString *)url
                          progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                 completionHandler:(void (^)(NSURLResponse *response, NSURL * filePath, NSError * error))completionHandler{
    //1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    //3.创建下载任务
    NSURLSessionDownloadTask *downloadTask = [mgr downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if(downloadProgressBlock){
            downloadProgressBlock(downloadProgress);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //拼接一个文件
        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:DOWNLOAD];
        
        NSFileManager *fileM = [NSFileManager defaultManager];
        
        if (![fileM fileExistsAtPath:fullPath]) {
            //文件不存在,创建一个
            [fileM createDirectoryAtPath:fullPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        fullPath = [fullPath stringByAppendingPathComponent:response.suggestedFilename];
        //返回路径 /Library/Caches/default
        return [NSURL fileURLWithPath:fullPath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        completionHandler(response,filePath,error);
    }];
    
    //4.执行方法
    [downloadTask resume];
    
    return downloadTask;
}

/*
 //示例程序
 -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
 {
 [self post];
 }
 
 -(void)get
 {
 //创建字典,转载参数
 NSDictionary *dictM =@{
                         @"username":@"520it",
                         @"pwd":@"520it",
                         @"type":@"JSON"
                        };
 
 [YYHttpTool get:@"http://120.25.226.186:32812/login" params:dictM success:^(id responseObj) {
        NSLog(@"responseObj = %@",responseObj);
    } failure:^(NSError *error) {
        NSLog(@"responseObj = %@",error);
    }];
 }
 
-(void)post
{
    NSDictionary *dictM =@{
                           @"username":@"520it",
                           @"pwd":@"520",
                           @"type":@"JSON"
                           };
    
    [YYHttpTool post:@"http://120.25.226.186:32812/login" params:dictM success:^(id responseObj) {
        NSLog(@"responseObj = %@",responseObj);
    } failure:^(NSError *error) {
        NSLog(@"error error error = %@",error);
    }];
    
}

 //文件下载完后保存在沙盒的 /Library/Caches/weibo 路径中
-(void)download
{
    [YYHttpTool download:@"http://120.25.226.186:32812/resources/images/minion_02.png" progress:^(NSProgress *downloadProgress) {
        NSLog(@"%f",1.0 *downloadProgress.completedUnitCount /downloadProgress.totalUnitCount);
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"%@ , %@",error, filePath);
    }];
}

 */

@end