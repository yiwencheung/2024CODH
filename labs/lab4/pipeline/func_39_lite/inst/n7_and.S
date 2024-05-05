#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n7_and_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_AND(0x5c95951a, 0xca00c414, 0x48008410)
    TEST_AND(0x9ba8ba70, 0xe99fce38, 0x89888a30)
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
END(n7_and_test)
