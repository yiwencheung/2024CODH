#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n21_pcaddu12i_test)
    
    addi.w s0, s0 ,1
    addi.w s2, zero, 0x0
###test inst
    TEST_PCADDU12I(0xc4bde)
    TEST_PCADDU12I(0xc41f2)
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
END(n21_pcaddu12i_test)
