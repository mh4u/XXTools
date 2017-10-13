//
//  NSObject+XXDeallocBlock.m
//  XXToolsExample
//
//  Created by xu xun on 2017/10/13.
//  Copyright © 2017年 xunxu. All rights reserved.
//

#import "NSObject+XXDeallocBlock.h"
#import <objc/runtime.h>
#import "XXDeallocBlockExecutor.h"
static void *kNSObject_XXDeallocBlocks;

@implementation NSObject (XXDeallocBlock)
- (id)xx_addDeallocBlock:(void (^)())deallocBlock
{
    if (deallocBlock == nil) {
        return nil;
    }
    
    NSMutableArray *deallocBlocks = objc_getAssociatedObject(self, &kNSObject_XXDeallocBlocks);
    if (deallocBlocks == nil) {
        deallocBlocks = [NSMutableArray array];
        objc_setAssociatedObject(self, &kNSObject_XXDeallocBlocks, deallocBlocks, OBJC_ASSOCIATION_RETAIN);
    }
    // Check if the block is already existed
    for (XXDeallocBlockExecutor *executor in deallocBlocks) {
        if (executor.deallocBlock == deallocBlock) {
            return nil;
        }
    }
    
    XXDeallocBlockExecutor *executor = [XXDeallocBlockExecutor executorWithDeallocBlock:deallocBlock];
    [deallocBlocks addObject:executor];
    return executor;
}

@end
