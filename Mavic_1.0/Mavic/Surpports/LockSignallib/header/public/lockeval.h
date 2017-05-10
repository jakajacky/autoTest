#ifndef _lock_eval_h
#define _lock_eval_h

#include "lockeval_basic.h"

#define USE_FLOAT

#ifdef USE_FLOAT
    #include "lock_evaluator_lf_conf.h"
    #define ALGO_BUF_SIZE (17000)
#else
    #include "lock_evaluator_l_conf.h"
    #define ALGO_BUF_SIZE (8000)
#endif

#include "lock_eval_ecg_conf.h"

typedef enum 
{
    lock_pulse,
    lock_ecg
} lock_type;

// �����㷨��״̬���
typedef volatile struct 
{
    uint32_t        quality_index;  // �ź�����ָ�� [0,5]������ʱ >= QUALITY_INDEX_LOCKED 
    uint32_t        saturated;      // �����ź��Ƿ񱥺ͣ�0 Ϊδ���ͣ��� 0 Ϊ����
    uint32_t        index;          // ��������״̬ʱ�Ĳ������ (reset() ����������ۼ�)
    uint32_t        lock_samples;   // ���ν�������״̬���ۼ����������� (ʧ���������ۼ�)
    pulse_direction direction;      // ���������� (ֻ������ʱ��������)
    uint32_t        amplitude;      // �źŷ��� (ֻ������ʱ��������)
    uint32_t        heart_rate;     // ���� (ֻ������ʱ��������)
	uint32_t        heart_rate_estimate; // ���ź����� >= 3��Ҳ��Ϊ����״̬��ʱ���ṩ������ֵ
    void *f_init;
    void *f_process;
    void *f_reset;
    
    // �㷨��Ҫ���ڴ�
    unsigned char algo_buf[ALGO_BUF_SIZE];
} lockeval_handle;

/**
 * lockeval ���������㷨
 * @param handle    lockeval handle
 * @param config    �㷨��������
 * @return handle
 */
lockeval_handle *lockeval_open(lockeval_handle *handle, lock_type type, void *config);

/*
 * lockeval �ر�
 * @param handle    lockeval handle
 */
void lockeval_close(lockeval_handle *handle);

/*
 * lockeval ��λ
 * @param handle    lockeval handle
 */
void lockeval_reset(lockeval_handle *handle);

/*
 * ��������
 * @param handle    lockeval handle
 * @param data      ����ֵ
 * @param len       ����Ĳ�����
 */
void lockeval_pushdata(lockeval_handle *handle, uint32_t *data, const uint16_t len);


/*
* �õ�����ֵ
*/
int get_heart_rate(lockeval_handle *handle);


/*
 * �õ��ź���������
*/
int get_signal_quality(lockeval_handle *handle);

#endif