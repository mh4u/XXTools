//
//  UIImage+XX.m
//  haoke
//
//  Created by xunxu on 16/8/31.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "UIImage+XX.h"

@implementation UIImage (XX)

- (UIImage *)xx_resizingModeStretch:(UIEdgeInsets)capInsets {
    return [self resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
}

- (UIImage *)xx_resizingModeTile:(UIEdgeInsets)capInsets {
    return [self resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeTile];
}

+ (UIImage *)xx_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
