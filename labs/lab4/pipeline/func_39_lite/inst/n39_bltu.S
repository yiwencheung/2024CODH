#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n39_bltu_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_BLTU(0xae057640, 0xa3f3f054, 0x087ad72a, 0xf9772780, 0x00000000, 0x00000000)
    TEST_BLTU(0xa1331f07, 0xce878855, 0x5f6eebfc, 0xfbf37fbc, 0x5f6eebfc, 0xfbf37fbc)
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
END(n39_bltu_test)
