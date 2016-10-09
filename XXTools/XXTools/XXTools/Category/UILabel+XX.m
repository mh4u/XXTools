//
//  UILabel+XX.m
//  haoke
//
//  Created by xunxu on 16/9/5.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "UILabel+XX.h"

@implementation UILabel (XX)

+ (instancetype)xx_labelWithTitle:(NSString *)title textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment fontOfSize:(CGFloat)size frame:(CGRect)frame {
    return ({
        UILabel *instance = [[UILabel alloc] initWithFrame:frame];
        instance.text = title;
        instance.textColor = color;
        instance.textAlignment = alignment;
        instance.font = [UIFont systemFontOfSize:size];
        instance;
    });
}

@end
