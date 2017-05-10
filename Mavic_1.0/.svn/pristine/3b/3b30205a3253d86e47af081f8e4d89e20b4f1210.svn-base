//
//  CommonEntities.m
//  Mavic
//
//  Created by zhangxiaoqiang on 2017/4/5.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "CommonEntities.h"

@implementation Peripheral

+ (NSArray *)primaryKeys {
    return @[@"macString", @"identifier", @"location"];
}

- (instancetype)initWithCBPeripheral:(CBPeripheral *)peripheral {
    self = [super init];
    
    if (self) {
        _name        = peripheral.name;
        _state       = peripheral.state;
        _identifier  = peripheral.identifier.UUIDString;
        _serviceUUID = @"0003CDD0-0000-1000-8000-00805F9B0131";
    }
    
    return self;
}

@end


@implementation Patient

+ (NSArray *)primaryKeys {
    return @[@"mobile"];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        _name = dictionary[@"name"];
        _mobile = dictionary[@"mobile"];
        _gender = dictionary[@"gender"];
        _age    = dictionary[@"age"];
        _height = [dictionary[@"height"] integerValue];
        _weight = [dictionary[@"weight"] integerValue];
    }
    return self;
}

- (instancetype)initWithUser:(User *)user {
    self = [super init];
    if (self) {
        _Id     = user.Id;
        _name   = user.name;
        _mobile = user.mobile;
        _gender = user.gender;
        _age    = [NSString stringWithFormat:@"%@ (%ld)", user.birth, user.age];
        _height = user.height;
        _weight = user.weight;
    }
    return self;
}

@end
