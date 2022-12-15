main:
	jal a1, iloop
    addi a2, zero, 0x0
    beq a2, zero, 0
    
iloop:
	lb a0, 0(zero)
    lb a0, 1(zero)
    lb a0, 2(zero)
    lb a0, 3(zero)
    lb a0, 4(zero)
    lb a0, 5(zero)
    lb a0, 6(zero)
    lb a0, 7(zero)
    nop
    nop
    nop
    lb a0, 8(zero)
    jalr a3, a1, 0
    
 mloop:
 	beq a2, zero, mloop
    
    

