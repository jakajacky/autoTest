#ifndef _lock_evaulator_l_conf_h
#define _lock_evaulator_l_conf_h

#include "lockeval_basic.h"

/**
 * 算法参数配置
 */
typedef struct
{
    // 是否使用 HPF
    BOOL USE_MOVING_HPF;

    // 未锁定时的波峰、波谷分割参数 
    // 相当于 SEG_MAX_OFFSET = 0.5 - SEG_GAP_WHEN_SYNCING，SEG_MIN_OFFSET = 0.5 + SEG_GAP_WHEN_SYNCING
    double SEG_GAP_WHEN_SYNCING;     

    // 波峰、波谷分割参数，[0, 1]
    // SEG_MAX_OFFSET 必须 < SEG_MIN_OFFSET，建议：两者和为 1，表示两个门限上下对称
    double SEG_MAX_OFFSET;          
    double SEG_MIN_OFFSET;          

    double ALLOWED_FLUCTUATION;      // 有效数据允许波动范围
    double AMP_FILTER;               // FIR
    double NOISE_FACTOR;

    double PERIOD_GITTER;            // 脉搏周期波动

    double TROUGH_PEAK_LEN_MIN_RATIO;// 波谷长度/波峰长度比的最小值
    uint32_t SIGNAL_MIN_AMP;    // 信号最小振幅
    double  IIR_PULSE_PERIOD_A;
    double  ALLOW_MISSING_QRS;       // 波形中可能缺失 n 个 QRS
    double  DOUBLE_QRS_ERROR;        // R 波分裂为两个峰的最大间隔
} lockeval_config;

extern lockeval_config g_lockeval_config;

#endif
