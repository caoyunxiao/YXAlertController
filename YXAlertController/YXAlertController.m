//
//  YXAlertController.m
//  YXAlertControllerDemo
//
//  Created by 曹云霄 on 2017/2/14.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import "YXAlertController.h"

@implementation YXAlertController



/**
 初始化base
 
 @param title          提示标题
 @param message        提示说明
 @param style          风格
 @return               UIAlertController
 */
UIAlertController *BaseAlert(NSString *title,NSString *message,UIAlertControllerStyle style) {
    
    UIAlertController *alertContr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    return alertContr;
}


/**
 提示选择框
 
 @param title          提示标题
 @param message        提示说明
 @param menuArray      菜单title Array
 @param style          风格
 @param completed      完成回调
 */
void ShowAlertView(NSString *title,NSString *message,NSArray *menuArray,UIAlertControllerStyle style,void(^completed)(NSInteger index)) {
    
    UIAlertController *alert = BaseAlert(title, message, style);
    for (int i=0; i<menuArray.count; i++) {
        NSString *menuTitle = menuArray[i];
        if (i == menuArray.count - 1) {
            [alert addAction:[UIAlertAction actionWithTitle:menuTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                if (completed) {
                    completed([menuArray indexOfObject:action.title]);
                }
            }]];
        }else {
            [alert addAction:[UIAlertAction actionWithTitle:menuTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (completed) {
                    completed([menuArray indexOfObject:action.title]);
                }
            }]];
        }
    }
    [AppRootViewController() presentViewController:alert animated:YES completion:nil];
}



/**
 自动获取app最顶层控制器
 
 @return UIViewController
 */
UIViewController *AppRootViewController() {
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (controller.presentedViewController != nil) {
        controller = controller.presentedViewController;
    }
    return  controller;
}



























@end
