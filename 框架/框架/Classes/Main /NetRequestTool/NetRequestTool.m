//
//  NetRequestTool.m
//  XLWB
//
//  Created by 陈迪 on 15/12/31.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "NetRequestTool.h"
#import "AFNetworking.h"

@implementation NetRequestTool

//单例
+(NetRequestTool *)shareManager
{
    static NetRequestTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetRequestTool alloc] init];
    });
    return instance;
}




// 类方法
// GET
+(void)CDGET:(NSString *)url params:(NSDictionary *)params success:(HttpRequestSuccessBlock)success failure:(HttpRequestFailedBlock)failure
{
    //1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //AFN的AFJSONResponseSerializer默认不接受text/plain这种类型，所以我们进到AFN中添加了此类型
    
    //3.发送请求
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}

// POST
+(void)CDPOST:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    //1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //AFN的AFJSONResponseSerializer默认不接受text/plain这种类型，所以我们进到AFN中添加了此类型
    
    //3.发送请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}

@end
