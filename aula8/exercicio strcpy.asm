.data
	string: .asciiz "123456789"
	string2:
.text

main:
	la $s0, string
	la $s1, string2
	
	li $a0, 0	#i
	
	#t0	#temp para char
	#t1 	#temp para string2[i]
	
cpy:
	add $t1, $s1, $a0	#string2[a0]
	
	lb $t0, 0($s0)		#pega char em string[a0]
	sb $t0, 0($t1)		#salva char em string2[a0]
	
	addi $s0, $s0, 1	#aponta pro proximo char
	addi $a0, $a0, 1	#i++
	
	beq $t0, $zero, exit	#se char for /0, termina programa
	j cpy
	
exit:
	li $v0, 4		#printa string
	move $a0, $s1
	syscall
	
	li $v0, 10		#fim
	syscall