//
//  NSString+Extension.m
//  XLWB
//
//  Created by 陈迪 on 15/10/23.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 *  告诉我文字：text 和字体：font 在多宽和多高的情况下：maxW 算出 昵称Label的大小:CGSize
 *
 */
-(CGSize)sizeFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]  = font;
    //    return [text sizeWithAttributes:attrs];
    
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);// 约束宽度，高度不约束：MAXFLOAT
    
#warning 系统适配：拿到当前手机的操作系统版本
//    NSString *version = [UIDevice currentDevice].systemVersion;
//    if ([version doubleValue] >= 7.0) {
    if (IOS7) {
        
        /**
         *  根据下面4个条件 算出text的CGRect
         *  @param WithSize :    高宽 约束条件
         *  @param NSStringDrawingOptions NSStringDrawingUsesLineFragmentOrigin:从头开始算
         *  @param attributes:   NSFontAttributeName
         *  @param context:      上下文
         *  @return bounceing...返回的是CGRect
         */
        return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        
    }else {
        
        return [self sizeWithFont:font constrainedToSize:maxSize];
    }
    
    
    
}
/**
 *  告诉我文字：text 和字体：font  算出 昵称Label的大小:CGSize
 *
 */
-(CGSize)sizeFont:(UIFont *)font
{
    return [self sizeFont:font maxW:MAXFLOAT];
}

@end
