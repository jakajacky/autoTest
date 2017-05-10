#ifndef _lock_evaluator_lf_h
#define _lock_evaluator_lf_h

#include "lockeval_basic.h"
#include "heart_rate_unlock.h"

#define  HISTORY_PERIOD         (25 * SAMPLE_RATE * 48 / 8 / MIN_VALID_HEART_RATE) // 历史纪录长度
#define  MINMAX_LEN             (HISTORY_PERIOD)
#define  WAVE_NUM               3

// HPF 长度 （必须为奇数）
#define  MOVING_HPF_LEN         (9 * SAMPLE_RATE / 20 * 2 + 1)

#ifndef M_PI 
#define M_PI 3.14159265358979323846
#endif

struct tag_ant_data;
#ifndef M_PI 
#define M_PI 3.14159265358979323846
#endif
// 不同状态下的回调函数
typedef int32_t (*f_process)(struct tag_ant_data *ant, int new_data);
typedef void (*f_split_seg)(struct tag_ant_data *ant, int16_t *arr, short start, short count);

#include "lock_evaluator_lf_conf.h"

// 信号评估状态机
typedef struct 
{
    f_split_seg split_seg;
    f_process process;
} eval_state;

// 波形区段
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

// 一个波形周期的峰-峰值
typedef struct {
    int32_t top;
	int32_t bottom;
} wave;

// 信号饱和方向
typedef enum
{
    SAT_UP,
    SAT_DOWN,
    SAT_NONE
} sat_dir;

// 饱和检测器状态信息
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

// 每个天线波形数据处理结构体
typedef struct tag_ant_data
{
    eval_state *cur_state;
    int32_t sample_counter;
	int     locked_samples;
    int16_t minmax[MINMAX_LEN];            // 历史数据中的极大、极小值所在位置 history[minmax]
    // short count;                // 极大、极小值个数
    short minmax_first;            // 第一个极值的序号
    short minmax_last;             // 最后一个极值的序号
    short hist_write;
    short hist_count;
    int lastD;                  // 上一个微分值
    BOOL is_first;              // 第一个数据点
	int32_t hist_min;			// history 内的最小值
	int32_t hist_max;			// history 内的最大值
	double valid_min;			// 有效信号的最小值
	double valid_max;          // 有效信号的最大值
    double noise;                    // 噪声
    double floor;                    // 信号底部偏移
    s8 phase;                 // 原始信号的相位
    int amplitude;              // 幅度
	short    immediate_pulse_period;
    double   filtered_pulse_period;
    double   signal_quality;

	double seg_min;
	double seg_max;

	// 一系列波的顶部和底部
	wave waves[WAVE_NUM];
	s8 wave_count;
    s8 wave_write;

    sat_state sat_state;
	moving_hpf hpf;

    int32_t history[HISTORY_PERIOD];	    // 历史数据（原始值），长度 PERIOD 个采样点

//	int hr_lockbypeak_counter;
	int hr_lockbypeak[HR_ARRAY_LEN]; // 锁定状态时的心率数组
	short hrlist_first;            // 第一个极值的序号
	short hrlist_last;             // 最后一个极值的序号

	int peakpos;
	uint32_t hrbypeak;
	BOOL peakUpward;
	// 算法需要的内存
	int hr_class_numarray[ARR_LEN(hrarrays)];  // record hr level number

	int hrstatis_memory[HR_ARRAY_LEN];
	short hrstatis_count; 
	short hrstatis_write;

    lockeval_config config;                 // must be the last field


} ant_data;    

// 锁定算法的状态输出
typedef volatile struct 
{
    uint32_t        quality_index;  // 信号质量指数 [0,5]，锁定时 >= QUALITY_INDEX_LOCKED 
    uint32_t        saturated;      // 本次信号是否饱和，0 为未饱和，非 0 为饱和
    pulse_direction direction;      // 脉搏波方向 (只有锁定时才有意义)
    uint32_t        amplitude;      // 信号幅度 (只有锁定时才有意义)
    double          period;
    int32_t         filtered;
} lock_state;

/**
 * 信号锁定处理
 */
void lockeval_imp_process(ant_data *ant, int32_t data,
	lock_state *state);

/**
 * 信号锁定算法初始化
 * 注意：主程序启动后，调用 process 函数前，需要先调用该函数进行初始化
 */
void lockeval_imp_init(ant_data *ant, lockeval_config *config);

/**
 * 信号锁定算法复位
 */
void lockeval_imp_reset(ant_data *ant);

/**
 * moving hfp
 */
int32_t moving_hpf_pass(int32_t *sum, int *z, 
        int *wrt_index, int z_len, int32_t new_data);

#endif
