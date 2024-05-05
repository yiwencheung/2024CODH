#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n11_slli_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_SLLI_W(0x47994e5e, 0x00000001, 0x8f329cbc)
    TEST_SLLI_W(0x482ac578, 0x00000009, 0x558af000)
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
END(n11_slli_w_test)
