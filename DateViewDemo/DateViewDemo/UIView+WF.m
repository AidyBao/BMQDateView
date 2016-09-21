//
//  UIView+WF.m
//  WeiXin
//
//  Created by Yong Feng Guo on 14-11-18.
//  Copyright (c) 2014年 Fung. All rights reserved.
//

#import "UIView+WF.h"

@implementation UIView (WF)

-(void)setH:(float)h{
    CGRect frm = self.frame;
    frm.size.height = h;
    self.frame = frm;
}

-(float)h{
    return self.frame.size.height;
}

-(void)setW:(float)w{
    CGRect frm = self.frame;
    frm.size.width = w;
    self.frame = frm;
}

-(float)w{
    return self.frame.size.width;
}

-(void)setY:(float)y{
    CGRect frm = self.frame;
    frm.origin.y = y;
    self.frame = frm;

}


-(float)y{
    return self.frame.origin.y;
}
//
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
@end
