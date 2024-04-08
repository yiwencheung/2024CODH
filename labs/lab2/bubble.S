.data
number:
    .word 32
datas:
    .word 79
    .word 14
    .word 3
    .word 29
    .word 13
    .word 32
    .word 21
    .word 90

.text
la.local $r1,number     
la.local $r2,datas
ld.w    $r1, $r1, 0
addi.w  $r3, $r2, 0
add.w   $r4, $r2, $r1
b       loopin
loopout:
addi.w  $r3, $r2, 0
addi.w  $r4, $r4, -4
beq     $r4, $r2, end
loopin:
ld.w    $r5, $r3, 0
ld.w    $r6, $r3, 4
blt     $r5, $r6, change
b       incre
change:
st.w    $r5, $r3, 4
st.w    $r6, $r3, 0
incre:
addi.w  $r3, $r3, 4
beq     $r3, $r4, loopout
b       loopin

end:
halt