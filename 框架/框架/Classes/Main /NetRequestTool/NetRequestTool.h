//
//  NetRequestTool.h
//  XLWB
//
//  Created by 陈迪 on 15/12/31.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求成功的Block
typedef void(^HttpRequestSuccessBlock)(id responseData);
//请求失败的Block
typedef void(^HttpRequestFailedBlock)(NSError *error);

@interface NetRequestTool : NSObject

//单例
+(NetRequestTool *)shareManager;

//对象方法
-(void)CDGET:(NSString *)url params:(NSDictionary *)params success:(HttpRequestSuccessBlock)success failure:(HttpRequestFailedBlock)failure;

-(void)CDPOST:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseData))success failure:(void (^)(NSError *error))failure;


// 在.m文件中只实现了 下面的 类方法


//优
//类方法
//+(void)CDGET:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseData))success failure:(void (^)(NSError *error))failure;
+(void)CDGET:(NSString *)url params:(NSDictionary *)params success:(HttpRequestSuccessBlock)success failure:(HttpRequestFailedBlock)failure;

+(void)CDPOST:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseData))success failure:(void (^)(NSError *error))failure;


@end
