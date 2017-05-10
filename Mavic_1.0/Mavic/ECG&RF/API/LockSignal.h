//
//  LockSignal.h
//  Mavic
//
//  Created by XiaoQiang on 2017/4/17.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockSignal : NSObject
- (NSMutableArray *)testPulsewave:(uint32_t*)pRawData raw:(const int)rawDataLen outB:(char*) outputBuffer len:(const int) outputBufferLen;
- (int)test:(uint32_t)p;
@end
