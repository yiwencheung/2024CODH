#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n5_slt_test)
    
    addi.w   s0, s0 ,1
    lu12i.w  s2, 0x0
###test inst
    TEST_SLT(0x7245316a, 0x783506f0, 0x00000001)
    TEST_SLT(0xf93a207e, 0x912ed208, 0x00000000)
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
END(n5_slt_test)
