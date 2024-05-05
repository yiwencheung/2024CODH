#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n41_ld_b_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_LD_B(0xc83b0be0, 0xd6760, 0x00007a1, 0x00007a0, 0x0000000b)
    TEST_LD_B(0x1eec280c, 0xd4598, 0x000080c, 0x000080c, 0x0000000c)
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
END(n41_ld_b_test)
