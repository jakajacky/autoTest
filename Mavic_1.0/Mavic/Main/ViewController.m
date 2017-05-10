//
//  ViewController.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/1.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "SettingViewController.h"
#import "MeasureViewController.h"
#import "DevicesViewController.h"
#import "LoginManager.h"
#import "YYKit.h"
#import "LoginApi.h"
#import "MainView.h"

@interface ViewController ()

@property (nonatomic, strong) LoginApi *api;

@property (nonatomic, strong) SettingViewController *setVC;

@property (nonatomic, strong) MeasureViewController *measureVC;

@property (nonatomic, strong) LoginViewController *login;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.naviBarView.backgroundColor = UIColorHex(028cb4);
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _setVC = [story instantiateViewControllerWithIdentifier:@"setting"];
    [_setVC.view setFrame:CGRectMake(0, 64, 120, self.view.height - 64)];
    [self addChildViewController:_setVC];
    
    _measureVC = [story instantiateViewControllerWithIdentifier:@"measure"];
    [_measureVC.view setFrame:CGRectMake(120, 64, self.view.width - 120, self.view.height - 64)];
    [self addChildViewController:_measureVC];
    
    [self.view addSubview:_setVC.view];
    [self.view addSubview:_measureVC.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _login = nil;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 是否登录
    LoginManager *loginManager = [LoginManager defaultManager];
    if (!loginManager.currentUser) {
        [loginManager getLastUserInfo];
    }
    if (loginManager.currentUser.isLatestLogin) {
        // 无需登录
        EZLog(@"直接进入，无需登录");
        // 验证登录信息
        
    }
    else {
        _login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
        
        [self presentViewController:_login animated:YES completion:^{
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private properties
- (LoginApi *)api {
    if (!_api) {
        _api = [LoginApi biz];
    }
    return _api;
}

@end
