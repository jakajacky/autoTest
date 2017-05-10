#ifndef _lock_evaulator_l_conf_h
#define _lock_evaulator_l_conf_h

#include "lockeval_basic.h"

/**
 * �㷨��������
 */
typedef struct
{
    // �Ƿ�ʹ�� HPF
    BOOL USE_MOVING_HPF;

    // δ����ʱ�Ĳ��塢���ȷָ���� 
    // �൱�� SEG_MAX_OFFSET = 0.5 - SEG_GAP_WHEN_SYNCING��SEG_MIN_OFFSET = 0.5 + SEG_GAP_WHEN_SYNCING
    double SEG_GAP_WHEN_SYNCING;     

    // ���塢���ȷָ������[0, 1]
    // SEG_MAX_OFFSET ���� < SEG_MIN_OFFSET�����飺���ߺ�Ϊ 1����ʾ�����������¶Գ�
    double SEG_MAX_OFFSET;          
    double SEG_MIN_OFFSET;          

    double ALLOWED_FLUCTUATION;      // ��Ч������������Χ
    double AMP_FILTER;               // FIR
    double NOISE_FACTOR;

    double PERIOD_GITTER;            // �������ڲ���

    double TROUGH_PEAK_LEN_MIN_RATIO;// ���ȳ���/���峤�ȱȵ���Сֵ
    uint32_t SIGNAL_MIN_AMP;    // �ź���С���
    double  IIR_PULSE_PERIOD_A;
    double  ALLOW_MISSING_QRS;       // �����п���ȱʧ n �� QRS
    double  DOUBLE_QRS_ERROR;        // R ������Ϊ������������
} lockeval_config;

extern lockeval_config g_lockeval_config;

#endif
