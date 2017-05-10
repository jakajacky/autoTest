//
//  SettingView.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/1.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"

@interface SettingView : UIView

@property (weak, nonatomic) IBOutlet UIView *top_container;

@property (weak, nonatomic) IBOutlet UITableView *middle_table;

@property (weak, nonatomic) IBOutlet UIView *bottom_container;

@property (weak, nonatomic) IBOutlet UIImageView *bottom_container_isSelectedImg;

@property (weak, nonatomic) IBOutlet UIImageView *head_icon;

@end
