#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n24_andi_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_ANDI(0x4c23cdd4, 0x00000e89, 0x00000c80)
    TEST_ANDI(0xa1286600, 0x000008aa, 0x00000000)
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
END(n24_andi_test)
