//
//  XXDeallocBlockExecutor.m
//  XXToolsExample
//
//  Created by xu xun on 2017/10/13.
//  Copyright © 2017年 xunxu. All rights reserved.
//

#import "XXDeallocBlockExecutor.h"

@implementation XXDeallocBlockExecutor

+ (instancetype)executorWithDeallocBlock:(void (^)())deallocBlock
{
    XXDeallocBlockExecutor *o = [XXDeallocBlockExecutor new];
    o.deallocBlock = deallocBlock;
    return o;
}

- (void)dealloc
{
    if (self.deallocBlock) {
        self.deallocBlock();
        self.deallocBlock = nil;
    }
}

@end
