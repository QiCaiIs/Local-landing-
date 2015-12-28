//
//  ViewController.m
//  本地登陆
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 apple. All rights reserved.
//

#define W_mainWeight ([[UIScreen mainScreen] bounds].size.width)
#define H_mainHeight (50)
#define H_poinHeight ([[UIScreen mainScreen] bounds].size.height-330)
#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView * clearImageView;
    UILabel * logLabel;
    UITextField * nameTextField;
    UITextField * keyWordTextField;
    UIButton * logButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    clearImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    clearImageView.image = [UIImage imageNamed:@"1.jpg"];
    clearImageView.userInteractionEnabled = YES;
    [self.view.layer addSublayer:clearImageView.layer];
    
    logLabel = [[UILabel alloc]initWithFrame:CGRectMake(H_mainHeight, H_mainHeight, W_mainWeight-H_mainHeight*2, H_mainHeight)];
    logLabel.text = @"登录界面";
    logLabel.textColor = [UIColor colorWithRed:238/255.0 green:160/255.0 blue:198/255.0 alpha:1];
    logLabel.textAlignment = NSTextAlignmentCenter;
    logLabel.font = [UIFont systemFontOfSize:23];
    [self.view.layer addSublayer:logLabel.layer];
    
    nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(H_mainHeight, H_poinHeight, W_mainWeight-H_mainHeight*2, H_mainHeight*2-30)];
    nameTextField.placeholder = @"      请输入用户名";
    nameTextField.layer.cornerRadius = 10;
    nameTextField.clipsToBounds = YES;
    nameTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:232/255.0 blue:161/255.0 alpha:0.7];
    [self.view addSubview:nameTextField];
    
    keyWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(H_mainHeight, H_poinHeight+H_mainHeight*2,W_mainWeight-H_mainHeight*2, H_mainHeight*2-30)];
    keyWordTextField.placeholder = @"      请输入密码";
    keyWordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:232/255.0 blue:161/255.0 alpha:0.7];
    keyWordTextField.layer.cornerRadius = 10;
    keyWordTextField.clipsToBounds = YES;
    [self.view addSubview:keyWordTextField];
    
    logButton = [UIButton buttonWithType:UIButtonTypeSystem];
    logButton.frame = CGRectMake(self.view.bounds.size.width-100, self.view.bounds.size.height-100, H_mainHeight, H_mainHeight);
    logButton.backgroundColor = [UIColor colorWithRed:238/255.0 green:160/255.0 blue:198/255.0 alpha:0.7];
    [logButton setTitle:@"登录" forState:normal];
    [logButton setTitleColor:[UIColor whiteColor] forState:normal];
    [logButton addTarget:self action:@selector(logButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    logButton.layer.cornerRadius = 25;
    logButton.clipsToBounds = YES;
    [self.view addSubview:logButton];
}

- (void)logButtonAction:(UIButton *)button
{
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDe objectForKey:@"name"];
    NSString *key = [userDe objectForKey:@"key"];
    if (name == nil && key == nil ) {
        if (![nameTextField.text isEqualToString:@""]&&![keyWordTextField.text isEqualToString:@""]) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"第一次登录成功" message:@"请记住密码呦😊" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道啦" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:nameTextField.text forKey:@"name"];
            [[NSUserDefaults standardUserDefaults] setObject:keyWordTextField.text forKey:@"key"];
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入完整的用户名" message:@"密码也要完整的呦😊" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道啦" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }else{
        if (name == nameTextField.text && key == keyWordTextField.text) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录成功" message:@"请记住密码呦😊" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道啦" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
