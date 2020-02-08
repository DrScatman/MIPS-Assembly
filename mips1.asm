.globl indexOf max sum13 sum67

.text 

indexOf:
li $t3, 0 # set array counter to 0
loop:
 la $t0, ($a1) # load array to $t0
 add $t5, $t3, $t0 # get registry address of value at index
 lw $t1, ($t5) # get array elements
 beq $t1, $a0, found # jump to found if equal to $a0
 slt $t4, $t1, $zero # if value is negative end of array true
 beq $t4, 1, loop_end # check for array end
 addi $t3, $t3, 4
 j loop
 
found:
 sra $t6 $t3, 2
 addi $v0, $t6, 0
 jr $ra

loop_end:
 li $v0, -1
 jr $ra
 
max:
 li $t3, 0 # set array counter to 0
 li $s0, 0 # current max index
 sll $s1, $a1, 2 # array end index
loop_2:
 la $t0, ($a0) # load array to $t0
 add $t5, $t3, $t0 # get registry address of value at index
 lw $t1, ($t5) # get array element at that index
 add $t8, $s0, $t0 # get registry address of value at current max index
 lw $t7, ($t8) # get array element of current max
 bge $t1, $t7 new_max # jump to new_max if current element is greater
 
 beq $t3, $s1, loop_2_end # check for array end
 addi $t3, $t3, 4 # increment index to point to next element
 j loop_2
 
 new_max:
 addi $s0, $t3, 0 # set new max index to current index
 
 beq $t3, $s1, loop_2_end # check for array end
 addi $t3, $t3, 4 # increment index to point to next element
 j loop_2
 
 loop_2_end:
 lw $v0, ($t8)
 jr $ra
 
sum13:
 li $s0, 0 #count
 li $s1, 0 #index
 sll $s4, $a1, 2 # array end index
 for:
 	bge $s1, $s4, doneFor
 	la $t0, ($a0) # load array to $t0
 	add $t5, $s1, $t0 # get registry address of value at index
 	lw $t1, ($t5) # get array elements
 	beq $t1, 13, bad13 # jump to found if equal to $a0
 	add $s0, $s0, $t1
 	addi $s1, $s1, 4
 	j for
 bad13:
 	addi $s1, $s1, 8
 	j for 
 doneFor:
  	addi $v0, $s0, 0
  	jr $ra
 
sum67:
 li $s0, 0 #count
 li $s1, 0 #index
 sll $s4, $a1, 2 # array end index
 li $s5, 0 #bool found 6
 for2:
 	bge $s1, $s4, doneFor2
 	la $t0, ($a0) # load array to $t0
 	add $t5, $s1, $t0 # get registry address of value at index
 	lw $t1, ($t5) # get array elements
 	beq $s5, 1, check7 #Here if 6 was found
 	beq $t1, 6, bad6 #if == 6
 	add $s0, $s0, $t1
 	addi $s1, $s1, 4  #inc
 	j for2
 bad6:
 	addi $s5, $0, 1 #set 6 flag true
 	addi $s1, $s1, 4 #inc
 	j for2 
 check7:
 	beq $t1, 7, good7
 	addi $s1, $s1, 4 #inc
 	j for2
 	good7:
 		addi $s5, $0, 0 #set 6 flag false
 		addi $s1, $s1, 4 #inc
 		j for2 
 doneFor2:
  	addi $v0, $s0, 0
  	jr $ra
