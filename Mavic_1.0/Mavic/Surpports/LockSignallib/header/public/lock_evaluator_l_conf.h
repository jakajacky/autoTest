#ifndef _lock_evaulator_l_conf_h
#define _lock_evaulator_l_conf_h

#include "lockeval_basic.h"

// ��������
#define Q_TYPE  int32_t
#define Q		Q_TYPE
#define Q8      Q_TYPE
#define Q16     Q_TYPE
#define N_Q		7           // Ĭ�ϲ��� Q7

#define VALUE_TO_QN(V, N) ((Q_TYPE)((V) * (1 << (N))))
#define QN_TO_VALUE(V, N) ((double)(V)/(1 << (N)))

#define VALUE_TO_Q(V) VALUE_TO_QN((V),N_Q)
#define Q_TO_VALUE(V) QN_TO_VALUE((V),N_Q)

/**
 * �㷨��������
 */
typedef struct
{
    // δ����ʱ�Ĳ��塢���ȷָ���� 
    // �൱�� SEG_MAX_OFFSET = 0.5 - SEG_GAP_WHEN_SYNCING��SEG_MIN_OFFSET = 0.5 + SEG_GAP_WHEN_SYNCING
    Q SEG_GAP_WHEN_SYNCING;     

    // ���塢���ȷָ������[0, 1]
    // SEG_MAX_OFFSET ���� < SEG_MIN_OFFSET�����飺���ߺ�Ϊ 1����ʾ�����������¶Գ�
    Q SEG_MAX_OFFSET;          
    Q SEG_MIN_OFFSET;          

    Q ALLOWED_FLUCTUATION;      // ��Ч������������Χ
    Q AMP_FILTER;               // FIR
    Q NOISE_FACTOR;

    Q PERIOD_GITTER;            // �������ڲ���

    Q TROUGH_PEAK_LEN_MIN_RATIO;// ���ȳ���/���峤�ȱȵ���Сֵ
    uint32_t SIGNAL_MIN_AMP;    // �ź���С���
    Q  IIR_PULSE_PERIOD_A;
    Q  ALLOW_MISSING_QRS;       // �����п���ȱʧ n �� QRS
    Q  DOUBLE_QRS_ERROR;        // R ������Ϊ������������
} lockeval_config;

extern lockeval_config g_lockeval_config;

#endif
