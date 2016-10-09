//
//  XXTools.h
//  XXTools
//
//  Created by xunxu on 16/9/27.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXTools : NSObject

#pragma mark - 系统权限
//相机权限
+ (void)authorization4album:(void (^)(NSString *msg, BOOL authorized))handle;

//相册权限
+ (void)authorization4capture:(void (^)(NSString *msg, BOOL authorized))handle;

#pragma mark - 转Json
+ (NSString *)convertDictionaryToJsonString:(NSDictionary *)dictionary;

+ (NSString *)convertArrayToJsonString:(NSArray *)array;

+ (NSDictionary *)convertJsonStringToDic:(NSString *)string;

+ (NSArray *)convertJsonStringToArray:(NSString*) string;

#pragma mark - info plist
+ (NSString *)bundleVersion;

#pragma mark - GCD
//延时任务
+ (void)doTaskAfter:(NSTimeInterval)delayTime withBlock:(dispatch_block_t)block;
//子线程
+ (void)doAsyTaskInGlobalQueue:(dispatch_block_t)block;
//主线程
+ (void)doTaskInMainQueueSync:(dispatch_block_t)block;
+ (void)doTaskInMainQueueAsync:(dispatch_block_t)block;
@end
