#ifndef _lock_evaulator_l_conf_h
#define _lock_evaulator_l_conf_h

#include "lockeval_basic.h"

// 定点类型
#define Q_TYPE  int32_t
#define Q		Q_TYPE
#define Q8      Q_TYPE
#define Q16     Q_TYPE
#define N_Q		7           // 默认采用 Q7

#define VALUE_TO_QN(V, N) ((Q_TYPE)((V) * (1 << (N))))
#define QN_TO_VALUE(V, N) ((double)(V)/(1 << (N)))

#define VALUE_TO_Q(V) VALUE_TO_QN((V),N_Q)
#define Q_TO_VALUE(V) QN_TO_VALUE((V),N_Q)

/**
 * 算法参数配置
 */
typedef struct
{
    // 未锁定时的波峰、波谷分割参数 
    // 相当于 SEG_MAX_OFFSET = 0.5 - SEG_GAP_WHEN_SYNCING，SEG_MIN_OFFSET = 0.5 + SEG_GAP_WHEN_SYNCING
    Q SEG_GAP_WHEN_SYNCING;     

    // 波峰、波谷分割参数，[0, 1]
    // SEG_MAX_OFFSET 必须 < SEG_MIN_OFFSET，建议：两者和为 1，表示两个门限上下对称
    Q SEG_MAX_OFFSET;          
    Q SEG_MIN_OFFSET;          

    Q ALLOWED_FLUCTUATION;      // 有效数据允许波动范围
    Q AMP_FILTER;               // FIR
    Q NOISE_FACTOR;

    Q PERIOD_GITTER;            // 脉搏周期波动

    Q TROUGH_PEAK_LEN_MIN_RATIO;// 波谷长度/波峰长度比的最小值
    uint32_t SIGNAL_MIN_AMP;    // 信号最小振幅
    Q  IIR_PULSE_PERIOD_A;
    Q  ALLOW_MISSING_QRS;       // 波形中可能缺失 n 个 QRS
    Q  DOUBLE_QRS_ERROR;        // R 波分裂为两个峰的最大间隔
} lockeval_config;

extern lockeval_config g_lockeval_config;

#endif
