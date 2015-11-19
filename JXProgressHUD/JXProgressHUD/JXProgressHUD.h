//
//  JXProgressHUD.h
//  JXProgressHUD
//
//  Created by ljx on 15/11/19.
//
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, JXProgressHUDStatus) {
    JXProgressHUDStatusSuccess = 0, //成功
    JXProgressHUDStatusError,       //失败
    JXProgressHUDStatusWaitting     //加载
};

@interface JXProgressHUD : MBProgressHUD

#pragma mark - 加载在Window使用的方法

/** 在window上添加一个只显示文字的HUD */
+ (void)showText:(NSString *)text;

/** 在window上添加一个提示`失败`的HUD */
+ (void)showFailureText:(NSString *)text;

/** 在window上添加一个提示`成功`的HUD */
+ (void)showSuccessText:(NSString *)text;

/** 在window上添加一个提示`加载中`的HUD, 需要手动关闭 */
+ (void)showLoadingText:(NSString *)text;

/** 手动隐藏HUD */
+ (void)hide;



#pragma mark - 加载在单个ViewController界面使用的方法
/** toView => self.view */

/** 在window上添加一个只显示文字的HUD */
+ (void)showText:(NSString *)text addToView:(UIView *)toView;

/** 在window上添加一个提示`失败`的HUD */
+ (void)showFailureText:(NSString *)text addToView:(UIView *)toView;

/** 在window上添加一个提示`成功`的HUD */
+ (void)showSuccessText:(NSString *)text addToView:(UIView *)toView;

/** 在一个View上添加一个提示`加载中`的HUD, 需要手动关闭*/
+ (void)showLoadingText:(NSString *)text addToView:(UIView *)toView;


@end
