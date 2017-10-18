//
//  UIView+Extension.m
//  XLWB
//
//  Created by 陈迪 on 15/9/16.
//  Copyright (c) 2015年 chenDi. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}


- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}








- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame  = frame;
}

-(void)setHeigh:(CGFloat)heigh
{
    CGRect frame  = self.frame;
    frame.size.height = heigh;
    self.frame =frame;
}


- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)heigh
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size =size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin =origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
- (CGPoint)origin
{
    return self.frame.origin;
}

@end
