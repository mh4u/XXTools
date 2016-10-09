
//
//  XXToolsMacro.h
//  XXTools
//
//  Created by xunxu on 16/9/27.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#ifndef XXToolsMacro_h
#define XXToolsMacro_h

#pragma mark - color

#define RandomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0]
#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#pragma mark - device

#define DeviceId [UIDevice currentDevice].identifierForVendor.UUIDString

#endif /* XXToolsMacro_h */
