//
//  XXDeallocBlockExecutor.h
//  XXToolsExample
//
//  Created by xu xun on 2017/10/13.
//  Copyright © 2017年 xunxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXDeallocBlockExecutor : NSObject
+ (instancetype)executorWithDeallocBlock:(void (^)())deallocBlock;
@property (nonatomic, copy) void (^deallocBlock)();
@end
