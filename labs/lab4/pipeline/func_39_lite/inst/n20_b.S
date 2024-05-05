#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n20_b_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_B(0x8c3e1efa, 0xeb2bd57c, 0x8c3e1efa, 0xeb2bd57c)
    TEST_B(0xfbc1f5d0, 0xb91bc0b0, 0xfbc1f5d0, 0xb91bc0b0)
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
END(n20_b_test)
