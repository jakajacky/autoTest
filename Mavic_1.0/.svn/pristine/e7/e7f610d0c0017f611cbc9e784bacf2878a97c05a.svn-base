#ifndef _lockeval_basic_h
#define _lockeval_basic_h

#include <stdint.h>

typedef signed char s8;
typedef unsigned char u8;

#ifndef BOOL  
#define BOOL  unsigned char
#endif

#ifndef FALSE 
#define FALSE   0
#endif

#ifndef TRUE    
#define TRUE    (1 > 0) 
#endif

#define QUALITY_INDEX_LOCKED 3
#define INVALID_SIGNAL         -10000  // 无效信号

#ifndef  SAMPLE_RATE
#define  SAMPLE_RATE            125
#endif

#ifndef  MIN_VALID_HEART_RATE
#define  MIN_VALID_HEART_RATE   40
#define  MAX_VALID_HEART_RATE   180
#endif

// 脉搏波方向
typedef enum 
{
    POSITIVE,
    NEGTIVE,
    UNKNOWN
} pulse_direction;

#define ARR_LEN(A) (sizeof(A) / sizeof(A[0]))

#define CIRCULAR_INDEX(arr, i) ((i) < 0 ?         \
         (i) + ARR_LEN(arr)                                   \
        : ((i) >= ARR_LEN(arr) ? (i) - ARR_LEN(arr) : (i)))
#define CIRCULAR_GET(arr, i) (arr[CIRCULAR_INDEX((arr), (i))])

#define CIRCULAR_INDEX2(len, i) (i >= (len) ?         \
         i - (len)                                   \
        : ((i) < 0 ? (i) + (len) : (i)))
#define CIRCULAR_GET2(arr, len, i) (arr[CIRCULAR_INDEX2((len), (i))])

#define CIRCULAR_INC(d, len, offset) ((d) + (offset) >= (len) ? (d) + (offset) - (len) : (d) + (offset))
#define CIRCULAR_DEC(d, len, offset) ((d) - (offset) < 0 ? (d) - (offset) + (len) : (d) - (offset))

#define SEC_PER_MIN            60

#define GET_CONF(X) (ant->config.X)

#endif
