#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n42_ld_h_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_LD_H(0x51842560, 0xd2bc4, 0x000027c, 0x000027c, 0x00002560)
    TEST_LD_H(0x2516116e, 0xd2220, 0x0000890, 0x0000890, 0x0000116e)
###detect exception
    bne s2, zero, inst_error
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
END(n42_ld_h_test)
