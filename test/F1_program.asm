main:
	jal a1, iloop
    addi a2, zero, 0x0
    beq a2, zero, 0
    
iloop:
	lw a0, 0(zero)
    lw a0, 1(zero)
    lw a0, 2(zero)
    lw a0, 3(zero)
    lw a0, 4(zero)
    lw a0, 5(zero)
    lw a0, 6(zero)
    lw a0, 7(zero)
    nop
    nop
    nop
    lw a0, 8(zero)
    jalr a3, a1, 0
    
 mloop:
 	beq a2, zero, mloop
    
    

