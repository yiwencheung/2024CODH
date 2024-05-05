#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n9_xor_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x00
###test inst
    TEST_XOR(0x1773df80, 0xb5af51d2, 0xa2dc8e52)
    TEST_XOR(0xe6223550, 0x909c98da, 0x76bead8a)
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
END(n9_xor_test)
