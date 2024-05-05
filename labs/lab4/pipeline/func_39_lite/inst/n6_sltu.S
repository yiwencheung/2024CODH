#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n6_sltu_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_SLTU(0x158f2b29, 0x421c0a42, 0x00000001)
    TEST_SLTU(0x60343bf8, 0xdd17b30a, 0x00000001)
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
END(n6_sltu_test)
