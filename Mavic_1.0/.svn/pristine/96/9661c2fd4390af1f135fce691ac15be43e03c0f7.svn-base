//
//  LoginManager.h
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/3/30.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginEntities.h"
#import "CommonEntities.h"

@interface LoginManager : NSObject<NSCopying>

@property (nonatomic, strong) User *currentUser;

@property (nonatomic, strong) Patient *currentPatient;

/**
 * 单例
 */

+ (instancetype)defaultManager;

/**
 * 数据库中 获取上一次登录的用户
 */
- (void)getLastUserInfo;

/**
 * 数据库中 获取上一次患者
 */
- (void)getLastPatientInfo;

/**
 * 数据库中 保存患者
 */
- (void)savePatientInfo:(Patient *)patient;

@end
