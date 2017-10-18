//
//  UITextView+Extension.m
//  XLWB
//
//  Created by 陈迪 on 15/12/18.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "UITextView+Extension.h"

@implementation UITextView (Extension)


-(void)insertAttributeText:(NSAttributedString *)attributeString
{
    [self insertAttributeText:attributeString settingBlock:nil];
}


-(void)insertAttributeText:(NSAttributedString *)attributeString settingBlock:(void (^)(NSMutableAttributedString *))settingBlock
{
#warning 图文混排
    //1.属性文字
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]init];
    //2.拼接之前的文字（包含图片和普通文字）
    [attributedText appendAttributedString:self.attributedText];
    
    //4.拼接有属性的文字
    //        [attributedText appendAttributedString:imageStr]; //只能拼接到最后面
#warning  selectedRange:光标位置属性
    NSUInteger location = self.selectedRange.location;
    //插入
//    [attributedText insertAttributedString:attributeString atIndex:location];
    //替换
    [attributedText replaceCharactersInRange:self.selectedRange withAttributedString:attributeString];
    
    
#warning  代码块：实现字体设置
    if (settingBlock) {
        settingBlock(attributedText);
    }
    //设置字体
    //    [attributedText addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attributedText.length)];
    
    self.attributedText = attributedText;
    
    //5.保证设置光标在输入内容的后面
    self.selectedRange = NSMakeRange(location + 1, 0);
}

@end
