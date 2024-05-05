#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n29_srl_w_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_SRL_W(0x1f8f6000, 0x0000001c, 0x00000001)
    TEST_SRL_W(0xe51f6e9c, 0x00000002, 0x3947dba7)
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
END(n29_srl_w_test)
