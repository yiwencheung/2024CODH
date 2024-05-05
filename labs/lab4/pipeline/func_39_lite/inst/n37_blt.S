#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n37_blt_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_BLT(0x53da7664, 0xd0bb3643, 0xede1bda0, 0x9184955e, 0x00000000, 0x00000000)
    TEST_BLT(0xc815806e, 0x1d9f9515, 0xc6ecc9a4, 0x6f0d3944, 0xc6ecc9a4, 0x6f0d3944)
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
END(n37_blt_test)
