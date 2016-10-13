//
//  UIImage+XX.h
//  haoke
//
//  Created by xunxu on 16/8/31.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XX)

+ (UIImage *)xx_imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)xx_resizingModeStretch:(UIEdgeInsets)capInsets;

- (UIImage *)xx_resizingModeTile:(UIEdgeInsets)capInsets;

@end
