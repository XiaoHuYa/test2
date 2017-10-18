//
//  UITextView+Extension.h
//  XLWB
//
//  Created by 陈迪 on 15/12/18.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Extension)
//HWEmotionPlaceHTextView 调用
-(void)insertAttributeText:(NSAttributedString *)attributeString;

#warning  代码块 的用法
-(void)insertAttributeText:(NSAttributedString *)attributeString settingBlock:(void (^)(NSMutableAttributedString *attributeText))settingBlock;
@end
