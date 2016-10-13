//
//  NSMutableArray+XX.m
//  haoke
//
//  Created by xunxu on 16/8/26.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "NSMutableArray+XX.h"

@implementation NSMutableArray (XX)
- (void)xx_sortObjArrayWithKey:(NSString *)key ascending:(BOOL)ascending {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    [self sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}
@end
