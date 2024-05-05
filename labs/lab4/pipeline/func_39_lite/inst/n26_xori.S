#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n26_xori_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_XORI(0x4406a500, 0x000004bf, 0x4406a1bf)
    TEST_XORI(0xb5f52460, 0x00000abe, 0xb5f52ede)
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
END(n26_xori_test)
