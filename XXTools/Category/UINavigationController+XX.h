//
//  UINavigationController+XX.h
//  haoke
//
//  Created by xunxu on 16/9/5.
//  Copyright © 2016年 xunxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (XX)

/*
 覆盖系统方法，用于修改状态栏颜色
 1.首先去 Info.plist 里面，把 UIViewControllerBasedStatusBarAppearance 设置为 YES或删除.
 2.添加NavigationController分类方法
 - (UIViewController *)childViewControllerForStatusBarStyle {
 return self.topViewController;
 }
 3.在具体的controller里实现
 - (UIStatusBarStyle)preferredStatusBarStyle
 */
- (UIViewController *)childViewControllerForStatusBarStyle;
@end
