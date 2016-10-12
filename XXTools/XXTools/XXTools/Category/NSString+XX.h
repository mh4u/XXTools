//
//  NSString+XX.h
//  haoke
//
//  Created by xunxu on 16/8/30.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XX)

#pragma mark - 加解密
/**
MD5加密
 */
- (NSString *)xx_md5HexDigest;

/*
 HMac_SHA1算法, 结果经过base64编码
 */
+ (NSString *)xx_hmacSha1:(NSString *)key text:(NSString *)text;


/**
 转换为Base64编码
 */
- (NSString *)xx_base64EncodedStr;

/**
 将Base64编码解码
 */
- (NSString *)xx_base64DecodedStr;

/*
 URL encode
 */
- (NSString *)xx_urlEncodedStr;

/*
 URL decode
 */
- (NSString *)xx_urlDecodedStr;

#pragma mark - 

//字节长度
- (NSInteger)byteLength;

#pragma mark - match
//匹配是否有效手机号
- (BOOL)matchPhone;



@end
