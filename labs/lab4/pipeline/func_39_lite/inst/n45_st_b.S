#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n45_st_b_test)
    
    addi.w s0, s0, 1
    li.w  s2, 0x0
###test inst
    TEST_ST_B(0xb4f00930, 0x7955c40a, 0xd16ec, 0x00001ec, 0x00001ec, 0xb4f0090a)
    TEST_ST_B(0x194331ca, 0x47657e06, 0xd5068, 0x0000868, 0x0000868, 0x19433106)
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
END(n45_st_b_test)
