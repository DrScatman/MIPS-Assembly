.globl nCk

.text 

nCk:
	blt $a0, $a1, doneErr
	beq $a1, 0, done1 # =0
	beq $a1, 1, doneN # =n
	beq $a0, $a1, done1 # =1
	
	# $s0 = result
	addi $sp, $sp, -12 # make space on stack
	# to store 3 registers
	sw $ra, 8($sp) # store $ra
	sw $a0, 4($sp) # save $a0 on stack
	sw $a1, 0($sp) # save $a1 on stack
	addi $a0, $a0 -1 # (n - 1)
	jal nCk;
	# Control will return here once done recursing

	lw $a1, 0($sp) # restore $a1 from stack
	lw $a0, 4($sp) # restore $a0 from stack
	lw $ra, 8($sp) # restore $ra 
	
	addi $a0, $a0 -1 # (n - 1)
	addi $a1, $a1 -1 # (k - 1)

	jal nCk
 
done1:	
	addi $sp, $sp, 12 # deallocate stack space
	addi $v0, $0, 1
	# store v0 on the stack to use later
	jr $ra

doneN:
	addi $v0, $0, $a0
	jr $ra
doneErr:
	addi $v0, $0, -1
	jr $ra
	