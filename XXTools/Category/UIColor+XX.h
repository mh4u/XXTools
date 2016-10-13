//
//  UIColor+XX.h
//  XXTools
//
//  Created by xunxu on 16/10/12.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XX)

//计算两种颜色的混色
- (UIColor *)mixColor:(UIColor *)color byRatio:(CGFloat)ratio;

@end
