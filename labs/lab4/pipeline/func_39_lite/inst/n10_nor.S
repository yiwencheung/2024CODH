#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n10_nor_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_NOR(0xad9cc00e, 0x38b7ec24, 0x424013d1)
    TEST_NOR(0x668d5db0, 0xa0945bf0, 0x1962a00f)
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
END(n10_nor_test)
