#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n40_bgeu_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_BGEU(0x3e290b61, 0x9d7d8a83, 0x26b8700b, 0xdbfe64e5, 0x00000000, 0x00000000)
    TEST_BGEU(0xfd5f4009, 0x7fac959f, 0xe3ac4197, 0x6c00bfbd, 0xe3ac4197, 0x6c00bfbd)
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
END(n40_bgeu_test)
