#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n1_lu12i_w_test)
    
    addi.w    s0, s0 ,1
    addi.w    s2, zero, 0x0
    lu12i.w   t2, 0x1
###test inst
    addi.w    t1, zero, 0x0
    TEST_LU12I_W(0x00000, 0x00000)
    TEST_LU12I_W(0x00001, 0x00000)
###detect exception
    bne s2, zero, inst_error
    nop
###score ++
    addi.w  s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    slli.w  t1, s0, 24
    NOP4
    or      t0, t1, s3 
    NOP4
    st.w    t0, s1, 0
    jirl    zero, ra, 0
    nop
END(n1_lu12i_w_test)
