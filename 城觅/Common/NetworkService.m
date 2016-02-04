//
//  NetworkService.m
//  TestAFNetWoring
//
//  Created by gj on 15/12/17.
//  Copyright © 2015年 www.iphonetrain.com 无限互联. All rights reserved.
//

#import "NetworkService.h"
#import "AppDelegate.h"

@implementation NetworkService

+ (void)requestDataWithURL:(NSString *)urlString
                HTTPMethod:(NSString *)method
                    params:(NSMutableDictionary *)params
          completionHandle:(BlockType) completionHandle {
    
    if (params == nil) {
        params = [[NSMutableDictionary alloc] init];
    }
    
//    //00 拼接access_token参数
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    SinaWeibo *sinaweibo = appDelegate.sinaweibo;
//    if (![sinaweibo isAuthValid]) {
//        return;
//    }
//    [params setObject:sinaweibo.accessToken forKey:@"access_token"];
//    
    
//    //1.拼接URL
//    NSString *requestURLString = [BaseUrl stringByAppendingString:urlString];
//    
    //2.构造URL
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    //3.创建网络请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = method;
    
    //4.请求参数 key1=value1&key2=value2&key3=value3
    NSMutableString *paramStr = [NSMutableString string];
    
    for (NSInteger i = 0; i < params.count; i++) {
        NSArray *keys = [params allKeys];
        NSString *key = keys[i];
        NSString *value = params[key];
        
        [paramStr appendFormat:@"%@=%@", key, value];
        //如果是最后一个键值对，则不加&
        if (i < params.count - 1) {
            [paramStr appendFormat:@"&"];
        }
        
    }
    
    //如果为GET请求,则请求参数拼接在URL后面
    if ([method isEqualToString:@"GET"]) {
        
        //http://www.baidu.com
        //http://www.baidu.com?key1=value1
        NSString *seperate = url.query ? @"&" : @"?";
        NSString *newUrlString = [NSString stringWithFormat:@"%@%@%@", urlString, seperate,paramStr];
        
        //重新设置加入了请求参数的URL
        request.URL = [NSURL URLWithString:newUrlString];
    
    }
    //如果为POST请求,则请求参数放到请求体中
    else if ([method isEqualToString:@"POST"]) {
        
        request.HTTPBody = [paramStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    //5.创建session
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //判断是否请求成功，成功才解析JSON，并回到主线程更新UI
        if (!error) {
            //解析JSON
            NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandle(json, response, error);
            });
            
        }
        
    }];
    
    [task resume];
    

}



+ (NSURLSessionDataTask *)requestAFUrl:(NSString *)urlString
          httpMethod:(NSString *)method
              params:(NSMutableDictionary *)params //token  文本
                data:(NSMutableDictionary *)dataDic //文件
               block:(BlockType)block{
    
    if (params == nil) {
        params = [[NSMutableDictionary alloc] init];
    }
    
//    //00 拼接access_token
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    SinaWeibo *sinaweibo = appDelegate.sinaweibo;
//    if (![sinaweibo isAuthValid]) {
//        return nil;
//    }
//    [params setObject:sinaweibo.accessToken forKey:@"access_token"];
//    
    
//    //01 构建urlString
//    NSString *fullUrlString = [BaseUrl stringByAppendingString:urlString];
    
    //02 构建manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
  //
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];


    if ([method isEqualToString:@"GET"]) {
        
        NSURLSessionDataTask *task = [manager GET:urlString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            block(responseObject,task.response,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            block(nil,task.response,error);
        }];

        return task;
    }
    
    
    if ([method isEqualToString:@"POST"]) {
        
        
        if (dataDic == nil) {//不带图片
            NSURLSessionDataTask *task = [manager POST:urlString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                block(responseObject,task.response,nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                block(nil,task.response,error);
            }];
            
            return  task;
            
    
        }else{//带图片
           
            
            NSURLSessionDataTask *task=  [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                for(NSString *key in dataDic) {
                    NSData *data = [dataDic objectForKey:key];
                    [formData appendPartWithFileData:data name:key fileName:@"file" mimeType:@"image/jpeg"];
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                block(responseObject,task.response,nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                block(nil,task.response,error);
            }];
            
            return  task;
            
        }
    
    }
    return  nil;
}








//+ (void)getHomeList:(NSMutableDictionary *)params
//              block:(BlockType)block{
//    
//    [NetworkService requestDataWithURL:home_timeline HTTPMethod:@"GET" params:params completionHandle:block];
//
//    
//}
//
//
//+ (void)sendWeibo:(NSMutableDictionary *)params
//            block:(BlockType)block{
//    
//    [NetworkService requestDataWithURL:send_update HTTPMethod:@"POST" params:params completionHandle:block];
//    
//    
//}
//
//+ (void)getAFHomeList:(NSMutableDictionary *)params block:(BlockType)block{
//
//    [NetworkService requestAFUrl:home_timeline httpMethod:@"GET" params:params data:nil block:^(id result, NSURLResponse *response, NSError *error) {
//        block(result,response,error);
//    }];
//}


//
//+ ( NSURLSessionDataTask *)sendWeibo:(NSString *)text
//                                image:(UIImage *)image
//                                block:(BlockType)block{
//    if (text == nil) {
//        return nil;
//    }
//    
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    [params setObject:text forKey:@"status"];
//    //01 如果只是文本
//    if (image == nil) {
//        
//        return  [NetworkService requestAFUrl:send_update httpMethod:@"POST" params:params data:nil block:block];
//        
//    }
//    
//    
//    //02 带图片
//    NSData *data = UIImageJPEGRepresentation(image, 1);
//    
//    //如果大于2M 则压缩
//    if (data.length > 1024*1024*2) {
//        
//        data = UIImageJPEGRepresentation(image, 0.5);
//    }
//    
//    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];
//    [dataDic setObject:data forKey:@"pic"];
//    
//    return [NetworkService requestAFUrl:send_upload httpMethod:@"POST" params:params data:dataDic block:block];
//
//    
//}
//




@end
