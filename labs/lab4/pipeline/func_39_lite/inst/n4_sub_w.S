#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n4_sub_w_test)
    
    addi.w s0, s0 ,1
    li.w     s2, 0x00
###test inst
    TEST_SUB_W(0xd6fc0584, 0x5f9765a8, 0x77649fdc)
    TEST_SUB_W(0xbf9c95c2, 0x3368890e, 0x8c340cb4)
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
END(n4_sub_w_test)
