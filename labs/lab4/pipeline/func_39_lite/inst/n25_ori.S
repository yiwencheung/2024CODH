#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n25_ori_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_ORI(0x0d48918a, 0x00000fe6, 0x0d489fee)
    TEST_ORI(0x891d17a0, 0x00000034, 0x891d17b4)
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
END(n25_ori_test)
