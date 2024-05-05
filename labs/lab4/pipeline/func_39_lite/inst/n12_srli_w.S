#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n12_srli_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_SRLI_W(0x8e8ffce0, 0x00000002, 0x23a3ff38)
    TEST_SRLI_W(0x49291230, 0x0000000f, 0x00009252)
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
END(n12_srli_w_test)
