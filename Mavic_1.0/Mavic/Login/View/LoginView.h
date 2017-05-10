//
//  LoginView.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/3/30.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"

#define RegisterSuccessNotification @"RegisterSuccessNotification"

@interface LoginView : UIView

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIButton *login;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@property (weak, nonatomic) IBOutlet UIButton *rememberPwd;

@property (weak, nonatomic) IBOutlet UIButton *loginApp;

@property (weak, nonatomic) IBOutlet UIButton *historyUserDrop;

@property (weak, nonatomic) IBOutlet UITableView *historyUserDropList;

@property (strong, nonatomic) RegisterView *registerView;

- (void)allRegisterTextResignFirstRespond;

- (void)removeAllObserverNotification;

@end
