//
//  NSString+Extension.h
//  XLWB
//
//  Created by 陈迪 on 15/10/23.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 *  告诉我文字：text 和字体：font 在多宽和多高的情况下：maxW 算出 昵称Label的大小:CGSize
 *
 */
-(CGSize)sizeFont:(UIFont *)font maxW:(CGFloat)maxW;

/**
 *  告诉我文字：text 和字体：font  算出 昵称Label的大小:CGSize
 *
 */
-(CGSize)sizeFont:(UIFont *)font;
@end
