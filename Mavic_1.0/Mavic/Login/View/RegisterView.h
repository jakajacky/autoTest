//
//  RegisterView.h
//  Mavic
//
//  Created by XiaoQiang on 2017/4/24.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *checkCodeField;

@property (weak, nonatomic) IBOutlet UIButton *sendCheckCodeBtn;

@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;


@end
