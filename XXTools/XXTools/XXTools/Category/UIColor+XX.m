//
//  UIColor+XX.m
//  XXTools
//
//  Created by xunxu on 16/10/12.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "UIColor+XX.h"

@implementation UIColor (XX)

- (UIColor *)mixColor:(UIColor *)color byRatio:(CGFloat)ratio {
    if(ratio > 1)
        ratio = 1;
    
    const CGFloat *components1 = CGColorGetComponents(self.CGColor);
    const CGFloat *components2 = CGColorGetComponents(color.CGColor);
    CGFloat oldR1, oldG1, oldB1, oldA1;
    CGFloat oldR2, oldG2, oldB2, oldA2;
    if (CGColorGetNumberOfComponents(self.CGColor) == 2) { //针对color是[UIColor whiteColor],[UIColor blackColor]等通过[UIColor colorWithWhite: alpha:]创建的颜色
        oldR1 = oldG1 = oldB1 = components1[0];
        oldA1 = components1[1];
    } else {
        oldR1 = components1[0];
        oldG1 = components1[1];
        oldB1 = components1[2];
        oldA1 = components1[3];
    }
    
    if (CGColorGetNumberOfComponents(color.CGColor) == 2) {
        oldR2 = oldG2 = oldB2 = components2[0];
        oldA2 = components2[1];
    } else {
        oldR2 = components2[0];
        oldG2 = components2[1];
        oldB2 = components2[2];
        oldA2 = components2[3];
    }
    
    CGFloat newR = fabs(oldR1 - oldR2)*ratio+MIN(oldR1, oldR2);
    CGFloat newG = fabs(oldG1 - oldG2)*ratio+MIN(oldG1, oldG2);
    CGFloat newB = fabs(oldB1 - oldB2)*ratio+MIN(oldB1, oldB2);
    CGFloat newA = fabs(oldA1 - oldA2)*ratio+MIN(oldA1, oldA2);
    
    return [UIColor colorWithRed:newR green:newG blue:newB alpha:newA];

}
@end
