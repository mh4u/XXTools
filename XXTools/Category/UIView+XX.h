//
//  UIView+XX.h
//  haoke
//
//  Created by xunxu on 16/8/26.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XX)

#pragma mark - frame
@property (nonatomic) CGFloat xx_left;

@property (nonatomic) CGFloat xx_top;

@property (nonatomic) CGFloat xx_right;

@property (nonatomic) CGFloat xx_bottom;

@property (nonatomic) CGFloat xx_width;

@property (nonatomic) CGFloat xx_height;

@property (nonatomic) CGFloat xx_centerX;

@property (nonatomic) CGFloat xx_centerY;

@property (nonatomic, readonly) CGFloat xx_screenViewX;

@property (nonatomic, readonly) CGFloat xx_screenViewY;

@property (nonatomic, readonly) CGRect xx_screenFrame;

@property (nonatomic) CGPoint xx_origin;

@property (nonatomic) CGSize xx_size;

#pragma mark - subview
- (void)xx_removeAllSubviews;

- (void)xx_removeViewWithTag:(NSInteger)tag;

- (void)xx_removeViewWithTags:(NSArray *)tagArray;

- (void)xx_removeViewWithTagLessThan:(NSInteger)tag;

- (void)xx_removeViewWithTagGreaterThan:(NSInteger)tag;

- (UIView *)xx_subviewWithTag:(NSInteger)tag;

#pragma mark - viewcontroller
//view所在的ViewController
- (UIViewController *)xx_responderViewController;

#pragma mark - draw rect
//设置圆角
- (void)xx_cornerRadius:(CGFloat)radius;

//设置圆角线框
- (void)xx_cornerRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;

//设置某几个角为圆角
- (void)xx_corners:(UIRectCorner)corners cornerRadius:(CGFloat)radius;

//设置圆形
- (void)xx_circular;

@end
