//
//  NSDate+XX.m
//  haoke
//
//  Created by xunxu on 16/9/1.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "NSDate+XX.h"

@implementation NSDate (XX)

+ (NSString *)xx_sysTimeStampString {
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%@", @((long long)timestamp)];
}

@end
