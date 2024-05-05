#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n17_bne_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_BNE(0xbcaabd27, 0x82a77a9d, 0x235fde00, 0xdd597dde, 0x235fde00, 0xdd597dde)
    TEST_BNE(0xdb386042, 0x4f6d035f, 0x94668000, 0xe3939568, 0x94668000, 0xe3939568)
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
END(n17_bne_test)
