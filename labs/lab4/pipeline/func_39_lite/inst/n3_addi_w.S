#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n3_addi_w_test)
    
    addi.w s0, s0 ,1
    li.w     s2, 0x0
###test inst
    TEST_ADDI_W(0xfb263d10, 0x00000c96, 0xfb2639a6)
    TEST_ADDI_W(0x7ec10538, 0x00000996, 0x7ec0fece)
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
END(n3_addi_w_test)
