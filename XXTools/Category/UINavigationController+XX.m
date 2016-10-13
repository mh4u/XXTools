//
//  UINavigationController+XX.m
//  haoke
//
//  Created by xunxu on 16/9/5.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import "UINavigationController+XX.h"

@implementation UINavigationController (XX)

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

@end
