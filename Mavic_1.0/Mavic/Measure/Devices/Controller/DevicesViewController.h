//
//  DevicesViewController.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/4.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeasureViewController.h"
#import "CommonEntities.h"
typedef void(^ConnectToPeripheralBlock)(Peripheral *, CBPeripheral *);

@interface DevicesViewController : UIViewController

@property (copy, nonatomic)   ConnectToPeripheralBlock cpBlock;
@property (strong, nonatomic) MeasureViewController *measureVC;

@end
