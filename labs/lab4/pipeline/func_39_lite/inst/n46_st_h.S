#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n46_st_h_test)
    
    addi.w s0, s0, 1
    li.w  s2, 0x0
###test inst
    TEST_ST_H(0xe15f8848, 0x0e1a3600, 0xd52a4, 0x0000ade, 0x0000adc, 0x36008848)
    TEST_ST_H(0x04105cf0, 0xb64d5300, 0xd3f6c, 0x000056a, 0x0000568, 0x53005cf0)
###detect exception
    bne s2, zero, inst_error
    nop
###score ++
    addi.w s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    slli.w t1, s0, 24
    NOP4
    or t0, t1, s3 
    NOP4
    st.w t0, s1, 0
    jirl zero, ra, 0
END(n46_st_h_test)
