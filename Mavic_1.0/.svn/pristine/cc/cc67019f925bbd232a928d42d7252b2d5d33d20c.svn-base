//
//  CheckByte_XOR.m
//  Mavic
//
//  Created by XiaoQiang on 2017/4/20.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "CheckByte_XOR.h"

@implementation CheckByte_XOR

#pragma mark - 从字节indexStart至字节indexEnd进行异或校验
+ (BOOL)checkByte:(Byte *)testByte
         formByte:(int)indexStart
           toByte:(int)indexEnd
        byXORByte:(int)indexXOR {
    Byte to = (Byte)testByte[indexStart]&0xff;
    for (int i = indexStart+1; i<= indexEnd; i++) {
        to = (Byte)to^(testByte[i]&0xff);
    }
    if (to == testByte[indexXOR]) {
        // 校验成功
        return YES;
    }
    else {
        // 校验失败
        return NO;
    }
}

+ (Byte)XORByte:(Byte *)byte
       formByte:(int)indexStart
         toByte:(int)indexEnd {
    // 异或校验
    Byte to = (Byte)byte[indexStart]&0xff;
    for (int i = indexStart+1; i<= indexEnd; i++) {
        to = (Byte)to^(byte[i]&0xff);
    }
    return to&0xff;
}

@end
