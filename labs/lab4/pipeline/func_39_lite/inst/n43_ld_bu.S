#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n43_ld_bu_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_LD_BU(0x79dbf0ff, 0xd5498, 0x0000408, 0x0000408, 0x000000ff)
    TEST_LD_BU(0x9b5bab6c, 0xd4430, 0x000052e, 0x000052c, 0x0000005b)
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
END(n43_ld_bu_test)
