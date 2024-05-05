#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n15_st_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_ST_W(0x61754443, 0xd77a0,  0x714,  0x714, 0x61754443)
    TEST_ST_W(0x5c4fb45a, 0xd4aac,  0x76c,  0x76c, 0x5c4fb45a)
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
    nop
END(n15_st_w_test)
