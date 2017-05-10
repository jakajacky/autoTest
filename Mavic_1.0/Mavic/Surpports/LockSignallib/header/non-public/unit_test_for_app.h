#ifndef UNIT_TEST_FOR_APP
#define UNIT_TEST_FOR_APP

#include <stdint.h>

/**
* unit test code for pulse wave lock evaluator
* [INPUT] pRawData: pointer to int array where raw data is located
* [INPUT] rawDataLen: length of raw data array
* [INPUT/OUTPUT] outputBuffer: The caller should provide a memory for storing debug info, 1MB(1024*1024) is recommended 
* [INPUT] outputBufferLen: the length of output buffer, in testPulsewave function, debug info will stop writting to output buffer if outputBufferLen is reached.
* Return Value: 0-success; <0 - failure
*/
extern int testPulsewave(uint32_t* pRawData, const int rawDataLen, char* outputBuffer, const int outputBufferLen);

#endif
