#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n22_slti_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_SLTI(0xd9d129b5, 0x00000988, 0x1)
    TEST_SLTI(0xbc13c90c, 0x000005e9, 0x1)
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
END(n22_slti_test)
