//
//  TwoViewController.m
//  JXProgressHUD
//
//  Created by ljx on 15/11/19.
//
//

#define TIME 2.0f

#import "TwoViewController.h"
#import "JXProgressHUD.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)text:(id)sender {
    [JXProgressHUD showText:@"手机号码格式不正确"];
}

- (IBAction)textToView:(id)sender {
    [JXProgressHUD showText:@"手机号码格式不正确2" addToView:self.view];
}

- (IBAction)success:(id)sender {
    [JXProgressHUD showSuccessText:@"加载成功"];
}

- (IBAction)successToView:(id)sender {
    [JXProgressHUD showSuccessText:@"加载成功2" addToView:self.view];
}

- (IBAction)error:(id)sender {
    [JXProgressHUD showFailureText:@"加载失败"];
}

- (IBAction)errorToView:(id)sender {
    [JXProgressHUD showFailureText:@"加载失败2" addToView:self.view];
}

- (IBAction)loadingToWindow:(id)sender {
    [JXProgressHUD showLoadingText:@"加载中1"];
    
    [NSTimer scheduledTimerWithTimeInterval:TIME
                                     target:self
                                   selector:@selector(success:)
                                   userInfo:nil
                                    repeats:NO];
}


- (IBAction)loadingToView:(id)sender {
    
    [JXProgressHUD showLoadingText:@"加载中2" addToView:self.view];
    
    [NSTimer scheduledTimerWithTimeInterval:TIME
                                     target:self
                                   selector:@selector(errorToView:)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)hideHUD {
    
    [JXProgressHUD hide];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
