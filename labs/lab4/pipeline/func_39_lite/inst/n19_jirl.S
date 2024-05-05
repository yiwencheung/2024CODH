#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n19_jirl_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_JIRL(0xc21e6e78, 0x0e2ea248, 0xc21e6e78, 0x0e2ea248)
    TEST_JIRL(0x6793c49c, 0x654b2d70, 0x6793c49c, 0x654b2d70)
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
END(n19_jirl_test)
