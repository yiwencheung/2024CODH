#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n14_ld_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_LD_W(0xc822c7e8, 0xd34c0,  0x6a8,  0x6a8, 0xc822c7e8)
    TEST_LD_W(0x71737c10, 0xdf660,  0x0e4,  0x0e4, 0x71737c10)
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
END(n14_ld_w_test)
