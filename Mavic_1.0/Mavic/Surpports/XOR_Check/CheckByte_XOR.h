//
//  CheckByte_XOR.h
//  Mavic
//
//  Created by XiaoQiang on 2017/4/20.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckByte_XOR : NSObject

/*
 ** 从字节indexStart至字节indexEnd进行异或校验
 * indexStart: 开始字节位
 * indexEnd  : 结束字节位
 * indexXOR  : 异或校验结果字节位
 */
+ (BOOL)checkByte:(Byte *)testByte
         formByte:(int)indexStart
           toByte:(int)indexEnd
        byXORByte:(int)indexXOR;
/*
 ** 从字节indexStart至字节indexEnd进行异或校验
 * indexStart: 开始字节位
 * indexEnd  : 结束字节位
 */
+ (Byte)XORByte:(Byte *)byte
       formByte:(int)indexStart
         toByte:(int)indexEnd;

@end
