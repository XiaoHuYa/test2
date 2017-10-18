//
//  NSDate+Extension.h
//  XLWB
//
//  Created by 陈迪 on 15/10/23.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)



//方法 1 需要传人一个 参数
/*
 
//是否为今年
- (BOOL)isThisYear:(NSDate *)date;

//是否为昨天
- (BOOL)isYesterday:(NSDate *)date;

//是否为今天
- (BOOL)isToday:(NSDate *)date;
 
*/



//是否为今年
- (BOOL)isThisYear;

//是否为昨天
- (BOOL)isYesterday;

//是否为今天
- (BOOL)isToday;

//方法 2  不 需要传人 参数

@end
