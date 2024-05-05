#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n27_sll_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_SLL_W(0x79dbdb34, 0x00000007, 0xeded9a00)
    TEST_SLL_W(0xa903fa10, 0x0000001d, 0x00000000)
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
END(n27_sll_w_test)
