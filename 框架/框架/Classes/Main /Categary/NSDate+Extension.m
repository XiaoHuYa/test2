//
//  NSDate+Extension.m
//  XLWB
//
//  Created by 陈迪 on 15/10/23.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)


//方法 1 需要传人一个 参数

/*
//是否为今年
- (BOOL)isThisYear:(NSDate *)date
{
    //当前时间
    NSDate *now = [NSDate date];
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //NSCalendarUnit 枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear;
    //获得某个时间饿年月日时分秒
    NSDateComponents *createDateCmps = [calendar components:unit fromDate:date];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:now];
    
    return createDateCmps.year == nowCmps.year;
}

//是否为昨天
- (BOOL)isYesterday:(NSDate *)date
{
    //当前时间
    NSDate *now = [NSDate date];
    
    //日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    //日期格式
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr  = [fmt stringFromDate:date]; //字符串：2015-10-22
    NSString *nowStr = [fmt stringFromDate:now];
    
    date = [fmt dateFromString:dateStr];//日期：2015-10-22 00：00：00
    now = [fmt dateFromString:nowStr];
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //NSCalendarUnit 枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    //计算两个日期的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

//是否为今天
- (BOOL)isToday:(NSDate *)date
{
    //当前时间
    NSDate *now = [NSDate date];
    
    //日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    //日期格式
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr  = [fmt stringFromDate:date];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}

*/






//方法 1 不 需要传人 参数

//是否为今年
- (BOOL)isThisYear
{
    //当前时间
    NSDate *now = [NSDate date];
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //NSCalendarUnit 枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear;
    //获得某个时间饿年月日时分秒
    NSDateComponents *createDateCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:now];
    
    return createDateCmps.year == nowCmps.year;
}

//是否为昨天
- (BOOL)isYesterday
{
    //当前时间
    NSDate *now = [NSDate date];
    
    //日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    //日期格式
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr  = [fmt stringFromDate:self]; //字符串：2015-10-22
    NSString *nowStr = [fmt stringFromDate:now];
    
   NSDate *date = [fmt dateFromString:dateStr];//日期：2015-10-22 00：00：00
    now = [fmt dateFromString:nowStr];
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //NSCalendarUnit 枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    //计算两个日期的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

//是否为今天
- (BOOL)isToday
{
    //当前时间
    NSDate *now = [NSDate date];
    
    //日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    //日期格式
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr  = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}
@end
