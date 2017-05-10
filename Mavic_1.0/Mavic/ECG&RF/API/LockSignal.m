//
//  LockSignal.m
//  Mavic
//
//  Created by XiaoQiang on 2017/4/17.
//  Copyright © 2017年 LoHas-Tech. All rights reserved.
//

#import "LockSignal.h"
#import "lockeval.h"
#import "lock_evaluator_lf.h"
#import "lock_eval_ecg.h"
#import <stdio.h>


static lockeval_handle handle;

@interface LockSignal ()

{
    lockeval_handle* pHandle;
}

@end

typedef struct
{
    int sample_counter;
    int lock_samples;
    lock_state state;
    union
    {
        ant_data ant;
        ecg_ant_data ant_ecg;
    };
} algo_data;

@implementation LockSignal

- (instancetype)init {
    self = [super init];
    if (self) {
        lock_type type = lock_pulse;
        pHandle = lockeval_open(&handle, type, &g_lockeval_config);
        lockeval_reset(pHandle);
    }
    return self;
}

- (int)test:(uint32_t)p {
//    lock_type type = lock_pulse;
//    lockeval_handle* pHandle = lockeval_open(&handle, type, &g_lockeval_config);
//    lockeval_reset(pHandle);
    
    lockeval_pushdata(pHandle, &(p), 1);
    
    algo_data *pAlgo = (algo_data *)(pHandle->algo_buf);
    
    return pAlgo->state.quality_index;
}

- (NSMutableArray *)testPulsewave:(uint32_t*)pRawData raw:(const int)rawDataLen outB:(char*) outputBuffer len:(const int) outputBufferLen
{
    
    lock_type type = lock_pulse;
    pHandle = lockeval_open(&handle, type, &g_lockeval_config);
//    lockeval_reset(pHandle);
    
    int counter = 0;
    int bufferCounter = 0;
    NSMutableArray *sigs = [NSMutableArray array];
    while (counter < rawDataLen)
    {
        lockeval_pushdata(pHandle, &(pRawData[counter]), 1);
        
        algo_data *pAlgo = (algo_data *)(pHandle->algo_buf);
        if (bufferCounter < outputBufferLen - 200)
        {
            bufferCounter += sprintf(outputBuffer+bufferCounter, "%d, %d, %f, %f, %d, %f,%f,%d,%d,%d,%d,%f,%f\n",
                                     pRawData[counter],
                                     pAlgo->state.filtered,
                                     pAlgo->ant.seg_min,
                                     pAlgo->ant.seg_max,
                                     pAlgo->state.quality_index,
                                     pAlgo->ant.valid_min,
                                     pAlgo->ant.valid_max,
                                     pAlgo->ant.hist_min,
                                     pAlgo->ant.hist_max,
                                     pAlgo->ant.immediate_pulse_period,
                                     pAlgo->ant.amplitude,
                                     pAlgo->ant.noise,
                                     pAlgo->ant.floor);
        }
        
        counter++;
        
//        NSLog(@"信号质量%d：%d", counter,pAlgo->state.quality_index);
//        if (pAlgo->state.quality_index >= 3) {
//            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//            [center postNotificationName:@"GoodSignal" object:@(pAlgo->state.quality_index)];
//        }
        [sigs addObject:@(pAlgo->state.quality_index)];
    }
    
    
//    if (outputBuffer) {
//        outputBuffer[outputBufferLen-1] = '\0';
//    }
    
    
//    return get_signal_quality(pHandle);
    return sigs;
}


@end
