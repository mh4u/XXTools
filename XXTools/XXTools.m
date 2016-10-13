//
//  XXTools.m
//  XXTools
//
//  Created by xunxu on 16/9/27.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "XXTools.h"
@import Photos;
@import AssetsLibrary;
@implementation XXTools

+ (void)doTaskAfter:(NSTimeInterval)delayTime withBlock:(dispatch_block_t)block {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

+ (void)doAsyTaskInGlobalQueue:(dispatch_block_t)block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),block);
}

+ (void)doTaskInMainQueueSync:(dispatch_block_t)block {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

+ (void)doTaskInMainQueueAsync:(dispatch_block_t)block {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}


+ (void)authorization4album:(void (^)(NSString *, BOOL))handle {
    if (!handle) return;
    PHAuthorizationStatus author = [PHPhotoLibrary authorizationStatus];
    if (author == PHAuthorizationStatusDenied || author == PHAuthorizationStatusRestricted) { //无权限
        NSDictionary *info =[[NSBundle mainBundle] infoDictionary];
        NSString *prodName =[info objectForKey:@"CFBundleDisplayName"];
        handle([NSString stringWithFormat:@"您没有相册权限， 请通过：“设置->%@”调整相册权限", prodName], NO);
    } else {
        handle(nil, YES);
    }
}

+ (void)authorization4capture:(void (^)(NSString *, BOOL))handle {
    if (!handle) return;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied) { //无权限
        NSDictionary *info =[[NSBundle mainBundle] infoDictionary];
        NSString *prodName =[info objectForKey:@"CFBundleDisplayName"];
        handle([NSString stringWithFormat:@"您没有相机权限， 请通过：“设置->%@”调整相机权限", prodName], NO);
    } else {
        handle(nil, YES);
    }
}

+ (NSDictionary *)convertJsonStringToDic:(NSString *)string {
    if (!string.length) return nil;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

+ (NSString *)convertDictionaryToJsonString:(NSDictionary *)dictionary {
    if (!dictionary) return nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


+ (NSArray *)convertJsonStringToArray:(NSString *)string {
    if (!string.length) return nil;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

+ (NSString *)convertArrayToJsonString:(NSArray *)array {
    if (!array.count) return nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


+ (NSString *)bundleVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
}

+ (CGFloat)heightAdjustWidth:(CGFloat)width font:(UIFont *)font forString:(NSString *)string {
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    NSStringDrawingOptions options = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading);
    CGSize actualsize =[string boundingRectWithSize:size options:options attributes:dic context:nil].size;
    return ceilf(actualsize.height);
}

+ (CGFloat)widthAdjustString:(NSString *)string font:(UIFont *)font {
    CGSize strSize = [string sizeWithAttributes:@{NSFontAttributeName:font}];
    return strSize.width;
}
@end
