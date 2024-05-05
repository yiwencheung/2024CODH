#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n23_sltui_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_SLTUI(0xc254e3d8, 0x00000469, 0x0)
    TEST_SLTUI(0x7a56334c, 0x000002f5, 0x0)
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
END(n23_sltui_test)
