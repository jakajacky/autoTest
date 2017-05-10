//
//  RegisterView.m
//  Mavic
//
//  Created by XiaoQiang on 2017/4/24.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "RegisterView.h"
#import "YYKit.h"
#import "NSString+CheckStyle.h"
#import "MBProgressHUD.h"
#import "UIImage+memory.h"

@interface RegisterView ()<UITextFieldDelegate>
{
    BOOL _isLoginBtnSelected;
    BOOL _isKboradAppear;
    CGRect _oldFrame;
    CGRect _newFrame;
    
}

@property (weak, nonatomic) IBOutlet UIView *mainContainerView;

@end

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.contentView = [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:self options:nil] lastObject];
    self.contentView.frame = self.bounds;
//    self.contentView.layer.cornerRadius  = 8.0;
//    self.contentView.layer.masksToBounds = YES;
//    self.contentView.clipsToBounds       = NO;
//    self.contentView.layer.borderColor   = UIColorHex(cccccc).CGColor;
//    self.contentView.layer.shadowColor   = UIColorHex(000000).CGColor;
//    self.contentView.layer.shadowOffset  = CGSizeMake(0, 2);
//    self.contentView.layer.shadowRadius  = 1;
//    self.contentView.layer.shadowOpacity = 0.09;
//    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    
    // 登录表单
    self.nameField.layer.cornerRadius = 6;
    self.nameField.borderStyle = 0;
    self.nameField.tag = 111;
    self.nameField.layer.borderWidth = 0.5;
    self.nameField.layer.borderColor = (__bridge CGColorRef)([UIColor colorWithWhite:1 alpha:0.6]);
    self.nameField.backgroundColor = UIColorHex(ffffff76);
    
    
    self.checkCodeField.layer.cornerRadius = 6;
    self.checkCodeField.borderStyle = 0;
    self.checkCodeField.tag = 111;
    self.checkCodeField.layer.borderWidth = 0.5;
    self.checkCodeField.layer.borderColor = (__bridge CGColorRef)([UIColor colorWithWhite:1 alpha:0.6]);
    self.checkCodeField.backgroundColor = UIColorHex(ffffff76);
    
    self.passWordField.layer.cornerRadius = 6;
    self.passWordField.borderStyle = 0;
    self.passWordField.tag = 112;
    self.passWordField.layer.borderWidth = 0.5;
    self.passWordField.layer.borderColor = (__bridge CGColorRef)([UIColor cyanColor]);
    self.passWordField.backgroundColor = UIColorHex(ffffff76);
    
    
    self.passWordField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock"]];
    self.checkCodeField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"code"]];
    self.nameField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    self.checkCodeField.leftViewMode = UITextFieldViewModeAlways;
    self.passWordField.leftViewMode = UITextFieldViewModeAlways;
    self.passWordField.secureTextEntry = YES;
    
    
    self.passWordField.rightView     = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nosee"]];
    self.passWordField.rightViewMode     = UITextFieldViewModeAlways;
    
    
    _contentView.backgroundColor = UIColorHex(ffffff51);
    [self setViewCornersWithView:_contentView byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight];
    
}

#pragma mark - 灵活设置view的圆角
- (void)setViewCornersWithView:(UIView *)view byRoundingCorners:(UIRectCorner)corner {
    UIBezierPath *maskPath  = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                    byRoundingCorners:corner
                                                          cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame         = view.bounds;
    maskLayer.path          = maskPath.CGPath;
    view.layer.mask         = maskLayer;
}

#pragma mark - 监听键盘事件
- (void)keyboradWillAppear:(NSNotification *)notifi {
    
    if (_isKboradAppear) {
        
        return;
    }
    _isKboradAppear = YES;
    
    CGRect kb_frame   = [notifi.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    _oldFrame = _mainContainerView.frame;
    
    _mainContainerView.transform = CGAffineTransformMakeTranslation(0, -kb_frame.size.height+160);
    
}

- (void)keyboradWillDisappear:(NSNotification *)notifi {
    _isKboradAppear = NO;
    _mainContainerView.transform = CGAffineTransformMakeTranslation(0, 0);
    
}

- (void)keyboradDidAppear:(NSNotification *)notifi {
    if (_nameField.editing) {
        [_nameField selectAll:self];
    }
}

#pragma mark - 文本框Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
//    [UIView animateWithDuration:0.5 animations:^{
//        CGFloat x      = _historyUserDropList.origin.x;
//        CGFloat y      = _historyUserDropList.origin.y;
//        CGFloat width  = _historyUserDropList.width;
//        CGRect frame = CGRectMake(x, y, width, 0);
//        _historyUserDropList.frame = frame;
//    }];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    if (textField.tag == 111) {
        if (![textField.text isValidPhoneNumber] && textField.text.length>0) {
            // 手机号格式不正确
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.contentView animated:YES];
            hud.labelText = @"请输入正确的手机号";
            hud.mode = MBProgressHUDModeText;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                // Do something...
                textField.text = @"";
                [MBProgressHUD hideHUDForView:self.contentView animated:YES];
            });
        }
    }
}

#pragma mark 文本框rightview点击事件
- (IBAction)pwdFieldRightViewClicked:(UIButton *)sender {
    EZLog(@"pwd click");
    self.passWordField.secureTextEntry = sender.selected;
    if (!sender.selected) {
        self.passWordField.rightView   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"see"]];
    }
    else {
        self.passWordField.rightView   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nosee"]];
    }
    sender.selected = !sender.selected;
    
}


@end
