#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n2_add_w_test)
    
    addi.w s0, s0 ,1
    addi.w s2, zero, 0x0
###test inst
    TEST_ADD_W(0x1adef300, 0x51dd58de, 0x6cbc4bde)
    TEST_ADD_W(0x9674ea60, 0xab475792, 0x41bc41f2)
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
END(n2_add_w_test)
