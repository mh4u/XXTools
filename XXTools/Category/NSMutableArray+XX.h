//
//  NSMutableArray+XX.h
//  haoke
//
//  Created by xunxu on 16/8/26.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (XX)
/**
 *  @author xuxun, 16-08-26 16:08:50
 *
 *  @brief 排序
 *
 *  @param key       对象排序属性
 *  @param ascending YES为升序，NO为降序
 */
- (void)xx_sortObjArrayWithKey:(NSString *)key ascending:(BOOL)ascending;
@end
