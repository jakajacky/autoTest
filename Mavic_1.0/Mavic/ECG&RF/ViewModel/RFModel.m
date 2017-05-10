//
//  RFModel.m
//  Mavic
//
//  Created by XiaoQiang on 2017/4/28.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "RFModel.h"
#import "LoginManager.h"



@interface RFModel ()

@property (nonatomic, strong) LoginManager *loginManager;

@end

@implementation RFModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)reloadData {
    [self.loginManager getLastPatientInfo];
    self.patient = self.loginManager.currentPatient;
}

- (BOOL)isMale {
    if (self.patient) {
        if ([self.patient.gender isEqualToString:@"男"]) {
            return YES;
        }
        else {
            return NO;
        }
    }
    else {
        return NO;
    }
}

- (NSInteger)age {
    NSString *birth = self.patient.age;
    NSString *ages = [birth componentsSeparatedByString:@"("].lastObject;
    NSString *age  = [ages componentsSeparatedByString:@")"].firstObject;
    
    return [age integerValue];
}

- (NSInteger)height {
    return self.patient.height;
}

- (NSString *)getPatientInfoWithStep:(MeasureStep)step {
    if (self.patient) {
        
        NSString *ages = [self.patient.age componentsSeparatedByString:@"("].lastObject;
        NSString *age  = [ages componentsSeparatedByString:@")"].firstObject;
        
        CGFloat BMI = self.patient.weight/((self.patient.height/100.0)*(self.patient.height/100.0));
        
        NSString *info = [NSString stringWithFormat:
                          @"ID：%@      姓名：%@      年龄：%@      身高：%ldcm      体重：%ldkg", self.patient.mobile, self.patient.name, age, self.patient.height, self.patient.weight];
        if (step == MeasureStep_Result) {
            info = [NSString stringWithFormat:
                    @"ID：%@      姓名：%@      年龄：%@      身高：%ldcm      体重：%ldkg      BMI：%.1f", self.patient.mobile, self.patient.name, age, self.patient.height, self.patient.weight, BMI];
        }
        return info;
    }
    else {
        return [NSString stringWithFormat:
         @"ID：%@      姓名：%@      年龄：%@      身高：%@      体重：%@", @"-------", @"---", @"30", @"156cm", @"65kg"];
    }
    
}

#pragma mark - properties
- (LoginManager *)loginManager {
    return [LoginManager defaultManager];
}

@end
