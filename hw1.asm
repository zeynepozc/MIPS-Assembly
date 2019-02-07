.data
fin: .asciiz "input_hw1.txt"      # filename for input
buffer: .space 256

zero: .asciiz "zero"
one: .asciiz "one"
two: .asciiz "two"
three: .asciiz "three"
four: .asciiz "four"
five: .asciiz "five"
six: .asciiz "six"
seven: .asciiz "seven"
eight: .asciiz "eight"
nine: .asciiz "nine"

.text
	main:
		
		jal fileProccessor	
	
		addi $t0, $zero, 0
	
		doWhile:
			
			lb $t6, buffer($t0)	 # Loading to buffer's t0. elements in register t6. 	
			
			ble $t6, '9', L1
				j else
				L1:		bge $t6, '0', L2
						j else
					L2:		addi $t0, $t0, 1
							lb $t6, buffer($t0)
							
							beq $t6, '.', L4
							
							ble $t6, '9', L3
							
							subi $t0, $t0, 1
							lb $t6, buffer($t0)
							j L5
							
							L3: 	bge $t6, '0', L4
								subi $t0, $t0, 1
								lb $t6, buffer($t0)
								j L5
								
								L4:
									subi $t0, $t0, 1
									lb $t6, buffer($t0)
									
								miniWhile:
									
									beq $t6, '.', L6
									bge $t6, '9', else
									ble $t6, '0', else
									
									
								L6:	li $v0, 11        #checks after the '.'
									move $a0, $t6
									syscall
									
									addi $t0, $t0, 1
									lb $t6, buffer($t0)
									
									j miniWhile
									
								
			L5:	
			
			num0:
				bne $t6, '0' , num1
				li $v0, 4
				la $a0, zero
				syscall
				j condition
			
			
			
			num1:	
				bne $t6, '1' , num2 
				li $v0, 4
				la $a0, one
				syscall
				j condition
				
			num2:
				bne $t6, '2' , num3
				li $v0, 4
				la $a0, two
				syscall
				j condition
				
				
			num3:
				bne $t6, '3' , num4
				li $v0, 4
				la $a0, three
				syscall
				j condition
				
			num4:
				bne $t6, '4' , num5
				li $v0, 4
				la $a0, four
				syscall
				j condition
			
			num5:
				
				bne $t6, '5' , num6
				li $v0, 4
				la $a0, five
				syscall
				j condition
				
				
			num6:
				bne $t6, '6' , num7
				li $v0, 4
				la $a0, six
				syscall
				j condition
				
			num7:
				bne $t6, '7' , num8 
				li $v0, 4
				la $a0, seven
				syscall
				j condition
				
			num8:
				bne $t6, '8' , num9 
				li $v0, 4
				la $a0, eight
				syscall
				j condition
				
			num9:
				bne $t6, '9' , else 
				li $v0, 4
				la $a0, nine
				syscall
				j condition
			
			
			else:
				li $v0, 11
				move $a0, $t6    # addi $a0, $zero, $t6
				syscall
				
			
		condition:
				
			addi $t0, $t0, 1 # t0= t0+1; 
			bne $t0, 256, doWhile
			
		
		
		li $v0, 10
		syscall	
			
		fileProccessor:
		
	
		li   $v0, 13       
		la   $a0, fin     
		li   $a1, 0        
		li   $a2, 0
		syscall          
		move $s6, $v0  

		
		li   $v0, 14       
		move $a0, $s6     
		la   $a1, buffer  
		li   $a2, 256     
		syscall      

		li   $v0, 16     
		move $a0, $s6     
		syscall		
		
		jr $ra
	
