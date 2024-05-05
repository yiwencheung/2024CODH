#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n28_sra_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_SRA_W(0x3e594300, 0x00000003, 0x07cb2860)
    TEST_SRA_W(0x171e0116, 0x00000004, 0x0171e011)
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
END(n28_sra_w_test)
