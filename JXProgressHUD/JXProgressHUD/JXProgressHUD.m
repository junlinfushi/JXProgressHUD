//
//  JXProgressHUD.m
//  JXProgressHUD
//
//  Created by ljx on 15/11/19.
//
//

#import "JXProgressHUD.h"

// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f
// 文字大小
#define TEXT_SIZE 15.0f

@interface JXProgressHUD() {
    UIView *addView;
}

@end

@implementation JXProgressHUD

+ (instancetype)sharedHUD {
    
    static JXProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        hud = [[JXProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (void)showStatus:(JXProgressHUDStatus)status text:(NSString *)text isToView:(UIView *)view{
    
    JXProgressHUD *hud = [JXProgressHUD sharedHUD];
    [hud show:YES];
    [hud setLabelText:text];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setLabelFont:[UIFont systemFontOfSize:TEXT_SIZE]];
    [hud setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    
    if (view == nil) {
        [[UIApplication sharedApplication].keyWindow addSubview:hud];
    } else {
        hud.frame = view.bounds;
        [view addSubview:hud];
    }
    
    
    switch (status) {
            
        case JXProgressHUDStatusSuccess: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_success"]];
            hud.customView = sucView;
            [hud hide:YES afterDelay:0.5f];
        }
            break;
            
        case JXProgressHUDStatusError: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_error"]];
            hud.customView = errView;
            [hud hide:YES afterDelay:1.0f];
        }
            break;
            
        case JXProgressHUDStatusWaitting: {
            
            hud.mode = MBProgressHUDModeIndeterminate;
        }
            break;
            
        default:
            break;
    }
}

+ (void)showText:(NSString *)text {
    
    JXProgressHUD *hud = [JXProgressHUD sharedHUD];
    [hud setBoxHeight:40];
    [hud show:YES];
    [hud setLabelText:text];
    [hud setMinSize:CGSizeZero];
    [hud setMode:MBProgressHUDModeText];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setLabelFont:[UIFont systemFontOfSize:TEXT_SIZE]];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    [hud hide:YES afterDelay:0.5f];
}

+ (void)showFailureText:(NSString *)text {
    
    [self showStatus:JXProgressHUDStatusError text:text isToView:nil];
}

+ (void)showSuccessText:(NSString *)text {
    
    [self showStatus:JXProgressHUDStatusSuccess text:text isToView:nil];
}

+ (void)showLoadingText:(NSString *)text {
    
    [self showStatus:JXProgressHUDStatusWaitting text:text isToView:nil];
}

+ (void)hide {
    
    [[JXProgressHUD sharedHUD] hide:YES];
}

+ (void)showText:(NSString *)text addToView:(UIView *)toView {
    JXProgressHUD *hud = [JXProgressHUD sharedHUD];
    [hud setBoxHeight:40];
    [hud show:YES];
    [hud setLabelText:text];
    [hud setMinSize:CGSizeZero];
    [hud setMode:MBProgressHUDModeText];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setLabelFont:[UIFont systemFontOfSize:TEXT_SIZE]];
    [toView addSubview:hud];
    [hud hide:YES afterDelay:0.5f];
}

+ (void)showFailureText:(NSString *)text addToView:(UIView *)toView{
    
    [self showStatus:JXProgressHUDStatusError text:text isToView:toView];
}

+ (void)showSuccessText:(NSString *)text addToView:(UIView *)toView{
    
    [self showStatus:JXProgressHUDStatusSuccess text:text isToView:toView];
}

+ (void)showLoadingText:(NSString *)text addToView:(UIView *)toView {
    [self showStatus:JXProgressHUDStatusWaitting text:text isToView:toView];
}


@end
