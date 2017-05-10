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

// 锁定算法的状态输出
typedef volatile struct 
{
    uint32_t        quality_index;  // 信号质量指数 [0,5]，锁定时 >= QUALITY_INDEX_LOCKED 
    uint32_t        saturated;      // 本次信号是否饱和，0 为未饱和，非 0 为饱和
    uint32_t        index;          // 进入锁定状态时的采样序号 (reset() 后序号重新累计)
    uint32_t        lock_samples;   // 本次进入锁定状态后累计锁定采样数 (失锁后重新累计)
    pulse_direction direction;      // 脉搏波方向 (只有锁定时才有意义)
    uint32_t        amplitude;      // 信号幅度 (只有锁定时才有意义)
    uint32_t        heart_rate;     // 心率 (只有锁定时才有意义)
	uint32_t        heart_rate_estimate; // 当信号质量 >= 3（也即为锁定状态）时，提供的心率值
    void *f_init;
    void *f_process;
    void *f_reset;
    
    // 算法需要的内存
    unsigned char algo_buf[ALGO_BUF_SIZE];
} lockeval_handle;

/**
 * lockeval 启动锁定算法
 * @param handle    lockeval handle
 * @param config    算法参数配置
 * @return handle
 */
lockeval_handle *lockeval_open(lockeval_handle *handle, lock_type type, void *config);

/*
 * lockeval 关闭
 * @param handle    lockeval handle
 */
void lockeval_close(lockeval_handle *handle);

/*
 * lockeval 复位
 * @param handle    lockeval handle
 */
void lockeval_reset(lockeval_handle *handle);

/*
 * 处理数据
 * @param handle    lockeval handle
 * @param data      采样值
 * @param len       传入的采样数
 */
void lockeval_pushdata(lockeval_handle *handle, uint32_t *data, const uint16_t len);


/*
* 得到心率值
*/
int get_heart_rate(lockeval_handle *handle);


/*
 * 得到信号质量分数
*/
int get_signal_quality(lockeval_handle *handle);

#endif