.globl wackySum combineFour

.text

wackySum:
	addi $a0, $0, 3
	addi $a1, $0, 7
	addi $a2, $0, 2
	
	addi $sp, $sp, -12 # Make room on stack
    	sw $a2, 8($sp) # store a2 [THIS IS c]
    	sw $a1, 4($sp) # store a1 [THIS IS b]
    	sw $a0, 0($sp) # store a0 [THIS IS a]
    
    	addi $t0, $a0, 0 # int i = a0
	
	for:
		lw $a2, 8($sp) # restore $a2
    		lw $a1, 4($sp) # restore $a1
    		lw $a0, 0($sp) # restore $a1
    		
		bgt $t0, $a1, done # check i > b
		
		addi $a0, $t0, 0 # a0 = i
		
		addi $a1, $t0, 1 # a1 = i + 1
		srl $a1, $a1, 1 # a1 = a1 / 2
		
		addi $a2, $t0, 2 # a2 = i + 2
		srl $a2, $a2, 1 # a2 = a2 / 2
		
		addi $a3, $t0, 3 # $a3 = i + 3
		
		jal combineFour
		add $s0, $s0, $v0 # sum = sum + combineFour(...)
		lw $a2, 8($sp) # restore $a2
		add $t0, $t0, $a2 # i = i + c
		j for
	jr $ra
combineFour:
	add $s1, $a0, $a1 # sum = a + b;
	add $s1, $s1, $a2 # sum = sum + c
	add $s1, $s1, $a3 # sum = sum + d
	
	andi $s2, $s1, 1 # s2 = least significant bit 
	bne $s2, 0, odd # check if s2 is even
	addi $v0, $s1, 0 # v0 = sum
	jr $ra # return sum
	odd:
		srl $v0, $s1, 1 # v0 = sum / 2
		jr $ra # return sum / 2

done:
	addi $v0, $s0, 0
	
	lw $a2, 8($sp)
	lw $a1, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 12
	syscall
