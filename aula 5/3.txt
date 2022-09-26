.data
.text

main:
	li $v0, 5		#read_int para v0
	syscall
	move $s0, $v0		#salva em s0
	
	li $v0, 5		#read_int para v0
	syscall
	move $s1, $v0		#salva em s1
	
	slt $s3, $s0, $s1		#1 se s1 maior
					#0 se s0 maior
	
	li $s2, 1
	beq $s3, $s2, s1higher		#1
	bne $s3, $s2, s0higher		#0
	
s0higher:
	move $a0, $s0
	j end
	
s1higher:
	move $a0, $s1
	j end

ifequal:
	li $a0, -111
	j end

end:
	li $v0, 1	#printa a0
	syscall
	
	li $v0, 10	#fecha
	syscall
