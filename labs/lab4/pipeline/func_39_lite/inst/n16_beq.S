#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n16_beq_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_BEQ(0x52919078, 0x81468400, 0x0fb16a80, 0xdf225ddc, 0x00000000, 0x00000000)
    TEST_BEQ(0x90db14d8, 0xa81a7400, 0x2fdac790, 0xe4a202d3, 0x00000000, 0x00000000)
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
END(n16_beq_test)
