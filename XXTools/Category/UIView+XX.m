//
//  UIView+XX.m
//  haoke
//
//  Created by xunxu on 16/8/26.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "UIView+XX.h"

@implementation UIView (XX)


- (CGFloat)xx_left {
    return self.frame.origin.x;
}

- (void)setXx_left:(CGFloat)xx_left {
    CGRect frame = self.frame;
    frame.origin.x = xx_left;
    self.frame = frame;
}

- (CGFloat)xx_top {
    return self.frame.origin.y;
}

- (void)setXx_top:(CGFloat)xx_top {
    CGRect frame = self.frame;
    frame.origin.y = xx_top;
    self.frame = frame;
}


- (CGFloat)xx_right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setXx_right:(CGFloat)xx_right {
    CGRect frame = self.frame;
    frame.origin.x = xx_right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)xx_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setXx_bottom:(CGFloat)xx_bottom {
    CGRect frame = self.frame;
    frame.origin.y = xx_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)xx_centerX {
    return self.center.x;
}

- (void)setXx_centerX:(CGFloat)xx_centerX {
    self.center = CGPointMake(xx_centerX, self.center.y);
}

- (CGFloat)xx_centerY {
    return self.center.y;
}

- (void)setXx_centerY:(CGFloat)xx_centerY {
    self.center = CGPointMake(self.center.x, xx_centerY);
}

- (CGFloat)xx_width {
    return self.frame.size.width;
}

- (void)setXx_width:(CGFloat)xx_width {
    CGRect frame = self.frame;
    frame.size.width = xx_width;
    self.frame = frame;
}


- (CGFloat)xx_height {
    return self.frame.size.height;
}

- (void)setXx_height:(CGFloat)xx_height {
    CGRect frame = self.frame;
    frame.size.height = xx_height;
    self.frame = frame;
}

- (CGFloat)xx_screenViewX {
    CGFloat x = 0.0f;
    for (UIView *view = self; view; view = view.superview) {
        x += view.xx_left;
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)xx_screenViewY {
    CGFloat y = 0;
    for (UIView *view = self; view; view = view.superview) {
        y += view.xx_top;
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)xx_screenFrame {
    return CGRectMake(self.xx_screenViewX, self.xx_screenViewY, self.xx_width, self.xx_height);
}


- (CGPoint)xx_origin {
    return self.frame.origin;
}

- (void)setXx_origin:(CGPoint)xx_origin {
    CGRect frame = self.frame;
    frame.origin = xx_origin;
    self.frame = frame;
}

- (CGSize)xx_size {
    return self.frame.size;
}

- (void)setXx_size:(CGSize)xx_size {
    CGRect frame = self.frame;
    frame.size = xx_size;
    self.frame = frame;
}

-(void)xx_removeAllSubviews{
    while ([self.subviews count] > 0) {
        UIView *subview = [self.subviews objectAtIndex:0];
        [subview removeFromSuperview];
    }
}

- (void)xx_removeViewWithTag:(NSInteger)tag {
    if (tag == 0) {
        return;
    }
    UIView *view = [self viewWithTag:tag];
    if (view) {
        [view removeFromSuperview];
    }
}

- (void)xx_removeSubViewArray:(NSMutableArray *)views{
    for (UIView *sub in views) {
        [sub removeFromSuperview];
    }
}

- (void)xx_removeViewWithTags:(NSArray *)tagArray{
    for (NSNumber *num in tagArray) {
        [self xx_removeViewWithTag:[num integerValue]];
    }
}

- (void)xx_removeViewWithTagLessThan:(NSInteger)tag{
    NSMutableArray *views = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if (view.tag > 0 && view.tag < tag) {
            [views addObject:view];
        }
    }
    [self xx_removeSubViewArray:views];
}

- (void)xx_removeViewWithTagGreaterThan:(NSInteger)tag{
    NSMutableArray *views = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if (view.tag > 0 && view.tag > tag) {
            [views addObject:view];
        }
    }
    [self xx_removeSubViewArray:views];
}

- (UIViewController *)xx_responderViewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


- (UIView *)xx_subviewWithTag:(NSInteger)tag{
    for (UIView *sub in self.subviews) {
        if (sub.tag == tag) {
            return sub;
        }
    }
    return nil;
}

- (void)xx_circular {
    [self xx_cornerRadius:self.bounds.size.width/2.0];
}

- (void)xx_cornerRadius:(CGFloat)radius {

    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;

}

- (void)xx_corners:(UIRectCorner)corners cornerRadius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius,radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)xx_cornerRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    [self xx_cornerRadius:radius];
    self.layer.borderWidth = lineWidth;
    self.layer.borderColor = lineColor.CGColor;

}




@end
