#ifndef _lock_evaluator_lf_h
#define _lock_evaluator_lf_h

#include "lockeval_basic.h"
#include "heart_rate_unlock.h"

#define  HISTORY_PERIOD         (25 * SAMPLE_RATE * 48 / 8 / MIN_VALID_HEART_RATE) // ��ʷ��¼����
#define  MINMAX_LEN             (HISTORY_PERIOD)
#define  WAVE_NUM               3

// HPF ���� ������Ϊ������
#define  MOVING_HPF_LEN         (9 * SAMPLE_RATE / 20 * 2 + 1)

#ifndef M_PI 
#define M_PI 3.14159265358979323846
#endif

struct tag_ant_data;
#ifndef M_PI 
#define M_PI 3.14159265358979323846
#endif
// ��ͬ״̬�µĻص�����
typedef int32_t (*f_process)(struct tag_ant_data *ant, int new_data);
typedef void (*f_split_seg)(struct tag_ant_data *ant, int16_t *arr, short start, short count);

#include "lock_evaluator_lf_conf.h"

// �ź�����״̬��
typedef struct 
{
    f_split_seg split_seg;
    f_process process;
} eval_state;

// ��������
typedef struct 
{
    int pos;
    short len;
    int maxValue;   // max when !isBottom; min when isBottom
    short maxIndex;
    int minmaxPos;
    short minmaxLen;
    BOOL is_bottom;
} segment;

// һ���������ڵķ�-��ֵ
typedef struct {
    int32_t top;
	int32_t bottom;
} wave;

// �źű��ͷ���
typedef enum
{
    SAT_UP,
    SAT_DOWN,
    SAT_NONE
} sat_dir;

// ���ͼ����״̬��Ϣ
typedef struct
{
    BOOL abnormal;
    BOOL saturated;
    sat_dir dir;
    int32_t last_up;
    int32_t last_down;
    int32_t last_data;
} sat_state;

typedef struct
{
	int32_t z[MOVING_HPF_LEN];
	int32_t sum;
	int wrt_index;
} moving_hpf;

// ÿ�����߲������ݴ���ṹ��
typedef struct tag_ant_data
{
    eval_state *cur_state;
    int32_t sample_counter;
	int     locked_samples;
    int16_t minmax[MINMAX_LEN];            // ��ʷ�����еļ��󡢼�Сֵ����λ�� history[minmax]
    // short count;                // ���󡢼�Сֵ����
    short minmax_first;            // ��һ����ֵ�����
    short minmax_last;             // ���һ����ֵ�����
    short hist_write;
    short hist_count;
    int lastD;                  // ��һ��΢��ֵ
    BOOL is_first;              // ��һ�����ݵ�
	int32_t hist_min;			// history �ڵ���Сֵ
	int32_t hist_max;			// history �ڵ����ֵ
	double valid_min;			// ��Ч�źŵ���Сֵ
	double valid_max;          // ��Ч�źŵ����ֵ
    double noise;                    // ����
    double floor;                    // �źŵײ�ƫ��
    s8 phase;                 // ԭʼ�źŵ���λ
    int amplitude;              // ����
	short    immediate_pulse_period;
    double   filtered_pulse_period;
    double   signal_quality;

	double seg_min;
	double seg_max;

	// һϵ�в��Ķ����͵ײ�
	wave waves[WAVE_NUM];
	s8 wave_count;
    s8 wave_write;

    sat_state sat_state;
	moving_hpf hpf;

    int32_t history[HISTORY_PERIOD];	    // ��ʷ���ݣ�ԭʼֵ�������� PERIOD ��������

//	int hr_lockbypeak_counter;
	int hr_lockbypeak[HR_ARRAY_LEN]; // ����״̬ʱ����������
	short hrlist_first;            // ��һ����ֵ�����
	short hrlist_last;             // ���һ����ֵ�����

	int peakpos;
	uint32_t hrbypeak;
	BOOL peakUpward;
	// �㷨��Ҫ���ڴ�
	int hr_class_numarray[ARR_LEN(hrarrays)];  // record hr level number

	int hrstatis_memory[HR_ARRAY_LEN];
	short hrstatis_count; 
	short hrstatis_write;

    lockeval_config config;                 // must be the last field


} ant_data;    

// �����㷨��״̬���
typedef volatile struct 
{
    uint32_t        quality_index;  // �ź�����ָ�� [0,5]������ʱ >= QUALITY_INDEX_LOCKED 
    uint32_t        saturated;      // �����ź��Ƿ񱥺ͣ�0 Ϊδ���ͣ��� 0 Ϊ����
    pulse_direction direction;      // ���������� (ֻ������ʱ��������)
    uint32_t        amplitude;      // �źŷ��� (ֻ������ʱ��������)
    double          period;
    int32_t         filtered;
} lock_state;

/**
 * �ź���������
 */
void lockeval_imp_process(ant_data *ant, int32_t data,
	lock_state *state);

/**
 * �ź������㷨��ʼ��
 * ע�⣺�����������󣬵��� process ����ǰ����Ҫ�ȵ��øú������г�ʼ��
 */
void lockeval_imp_init(ant_data *ant, lockeval_config *config);

/**
 * �ź������㷨��λ
 */
void lockeval_imp_reset(ant_data *ant);

/**
 * moving hfp
 */
int32_t moving_hpf_pass(int32_t *sum, int *z, 
        int *wrt_index, int z_len, int32_t new_data);

#endif
