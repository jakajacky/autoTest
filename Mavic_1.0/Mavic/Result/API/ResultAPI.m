//
//  ResultAPI.m
//  Mavic
//
//  Created by XiaoQiang on 2017/5/10.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "ResultAPI.h"
#import "DCHttpRequest.h"
#import "LoginManager.h"

@interface ResultAPI ()
{
    NSDictionary *params;
}

@property (nonatomic, strong) DCHttpRequest *request;


@end

@implementation ResultAPI


#pragma mark - 获取历史PWV数据
- (void)getHistoryPWVResultWithUserId:(NSString *)Id completion:(void (^)(BOOL success,id result, NSString *msg))complete {
    User *user = [LoginManager defaultManager].currentUser;
    
    params = @{@"user_id"   : @(user.Id.integerValue)};
    [self loadRequestProperties];
    
    [self.request startWithSuccess:^(id result) {
        complete(YES, result, @"");
        
    } failure:^(NSInteger errCode, NSString *errMsg, NSDictionary *userInfo) {
        complete(NO, userInfo,errMsg);
    }];
}

- (void)loadRequestProperties
{
    [self.request cancelRequest];
    
    self.request.type    = DCHttpRequestTypePOST;
    self.request.baseUrl = BASE_URL;
    self.request.method  = @"patchScene/q/listyears";
    self.request.params  = params;
    
    self.request.allowsLogMethod       = kLogEnabled;
    self.request.allowsLogHeader       = kHttpRequestAllowsLogHeader;
    self.request.allowsLogResponseGET  = kHttpRequestAllowsLogResponseGET;
    self.request.allowsLogResponsePOST = kHttpRequestAllowsLogResponsePOST;
    self.request.allowsLogRequestError = kHttpRequestAllowsLogRequestError;
    
    User *user = [LoginManager defaultManager].currentUser;
    
    [self.request setValue:[NSString stringWithFormat:@"%ld",user.APP_KEY]
        forHTTPHeaderField:@"APP_KEY"];
    [self.request setValue:user.APP_TOKEN
        forHTTPHeaderField:@"APP_TOKEN"];
    [self.request setValue:ACCESS_TOKEN
        forHTTPHeaderField:@"ACCESS_TOKEN"];
    [self.request setValue:@"application/json"
        forHTTPHeaderField:@"Content-Type"];
    
}

- (DCHttpRequest *)request {
    if (!_request) {
        _request = [[DCHttpRequest alloc] init];
    }
    return _request;
}

@end
