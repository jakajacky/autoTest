#ifndef _lock_eval_ecg_h
#define _lock_eval_ecg_h

#include "lock_evaluator_lf.h"
#include "lock_eval_ecg_conf.h"

#define ECG_LPF_LEN 50
#define HPF_MAX_LEN 500
#define SUM_LPF_MAX_LEN SAMPLE_RATE
#define ECG3_WAVE_NUM 20

struct tag_ant_ecg3;

// 不同状态下的回调函数
typedef int (*f_ecg3_process)(struct tag_ant_ecg3 *ant, int new_data);

// 信号评估状态机
typedef struct 
{
    f_ecg3_process process;
} ecg3_eval_state;

// 波类型
typedef enum tag_ecg3_wave_type
{
    Unknown,
    QRS,
    T
} ecg3_wave_type;

// 波信息
typedef struct tag_ecg3_wave
{
    int pos;
    int len;
    int amp;
    ecg3_wave_type type;
} ecg3_wave;

typedef struct
{
	double h[ECG_LPF_LEN];
	int32_t x[ECG_LPF_LEN];
	int wrt_index;
} fir;

typedef struct
{
	int32_t z[HPF_MAX_LEN];
	int32_t sum;
    int z_len;
	int wrt_index;
} ecg_moving_hpf;

typedef struct
{
    double lp[SUM_LPF_MAX_LEN];
    double sum;
    int wrt_index;
    int len;
} sum_filter;

typedef struct tag_d_array
{
    double data[ECG3_WAVE_NUM];
    int len;
} d_array;

typedef struct tag_ant_ecg3
{
    ecg3_eval_state *cur_state;
    int32_t sample_counter;
	int     locked_samples;
    short hist_write;
    short hist_count;
    BOOL  is_first;              // 第一个数据点
	int32_t hist_min;			// history 内的最小值
	int32_t hist_max;			// history 内的最大值
	short    immediate_pulse_period;
    double   filtered_pulse_period;
    double   filtered_delta_t;
    double   signal_quality;

	double seg_min;
	double seg_max;

	// 一系列波的顶部和底部
	ecg3_wave waves[ECG3_WAVE_NUM];
	s8 wave_count;
    s8 wave_write;
    ecg3_wave *running_wave;

    d_array d_arr[4];
    int32_t history[HISTORY_PERIOD];	    // 历史数据（原始值），长度 PERIOD 个采样点
    lockeval_t_based_ecg_config config;     // must be the last field
} ecg3_ant_data;

typedef struct
{
    ant_data pw_ant;
    fir lpf;
    ecg_moving_hpf hpf;
    sum_filter sum_lpf;
    lockeval_pulse_based_ecg_config config;
} ecg1_ant_data;

typedef struct
{
    ecg1_ant_data ecg1_ant;
    ecg3_ant_data ecg3_ant;
} ecg_ant_data;

/**
 * 信号锁定处理
 */
void lockeval_imp_ecg_process(ecg_ant_data *ant, const int32_t data,
	lock_state *state);

/**
 * 信号锁定算法初始化
 * 注意：主程序启动后，调用 process 函数前，需要先调用该函数进行初始化
 */
void lockeval_imp_ecg_init(ecg_ant_data *ant, lockeval_ecg_config *config);

/**
 * 信号锁定算法复位
 */
void lockeval_imp_ecg_reset(ecg_ant_data *ant);

#endif
