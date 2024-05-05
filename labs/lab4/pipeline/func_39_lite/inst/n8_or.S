#include "asm.h"
#include "regdef.h"
#include "inst_test.h"

LEAF(n8_or_test)
    
    addi.w s0, s0 ,1
    li.w  s2, 0x0
###test inst
    TEST_OR(0x50e41484, 0xad35ea94, 0xfdf5fe94)
    TEST_OR(0xbbbfafe4, 0xc8e94400, 0xfbffefe4)
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
END(n8_or_test)
