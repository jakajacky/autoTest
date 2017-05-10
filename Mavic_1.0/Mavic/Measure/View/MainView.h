//
//  MainView.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/1.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddUserInfo.h"
#import "DeviceList.h"

@interface MainView : UIView

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UIButton *L_T_AidBtn;
@property (weak, nonatomic) IBOutlet UIButton *R_T_AidBtn;
@property (weak, nonatomic) IBOutlet UIButton *L_B_AidBtn;
@property (weak, nonatomic) IBOutlet UIButton *R_B_AidBtn;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIView *layerAnimaView;
@property (strong, nonatomic) AddUserInfo *addUserView;
@property (strong, nonatomic) DeviceList  *deviceListView;

@end
