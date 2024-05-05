#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n13_srai_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_SRAI_W(0x7e0083f0, 0x00000009, 0x003f0041)
    TEST_SRAI_W(0x13e680c0, 0x00000018, 0x00000013)
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
END(n13_srai_w_test)
