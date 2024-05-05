#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n44_ld_hu_test)
    
    addi.w s0, s0, 1
    li.w  s2, 0x0
###test inst
    TEST_LD_HU(0xc5e0fd00, 0xd1dfc, 0x000055e, 0x000055c, 0x0000c5e0)
    TEST_LD_HU(0x258707b2, 0xdbd8c, 0x0000c34, 0x0000c34, 0x000007b2)
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
END(n44_ld_hu_test)
