#ifndef _lock_eval_ecg_conf_h
#define _lock_eval_ecg_conf_h

#include "lockeval_basic.h"

#include "lock_evaluator_lf_conf.h"

typedef struct
{
    lockeval_config pw_config;

    /**
     * 系数 M
     */
    double M_FACTOR;

    /**
     * SumLP 的长度
     */
    double LP_LEN;
} lockeval_pulse_based_ecg_config;

typedef struct
{
    /**
     * 系数 M
     */
    double M_FACTOR;

    /**
     * SumLP 的长度
     */
    double LP_LEN;

    double IIR_PULSE_PERIOD_A;    // 脉搏周期 IIR 滤波器系数
    double SEG_GAP_WHEN_SYNCING;
    double PERIOD_JITTER;          // 脉搏周期波动
    double SEG_MAX_OFFSET;        // 波峰、波谷分割参数，[0, 1]
    double SEG_MIN_OFFSET;        // SEG_MAX_OFFSET 必须 < SEG_MIN_OFFSET
} lockeval_t_based_ecg_config;

typedef struct tag_lockeval_t_based_ecg_config
{
    lockeval_pulse_based_ecg_config ecg1;
    lockeval_t_based_ecg_config ecg3;
} lockeval_ecg_config;

#endif
