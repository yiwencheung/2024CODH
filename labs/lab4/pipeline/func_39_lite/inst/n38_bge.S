#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n38_bge_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_BGE(0x4ec26512, 0x2c545359, 0xe8136eb3, 0x869af5c2, 0xe8136eb3, 0x869af5c2)
    TEST_BGE(0xe0e8e956, 0x3ba1a250, 0x603ac06c, 0x44cfcab4, 0x00000000, 0x00000000)
###detect exception
    bne s2, zero, inst_error
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
END(n38_bge_test)
