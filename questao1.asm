#Escreva um programa em assembly do mips que receba dois números do teclado e imprima o maior.
#Caso os números sejam iguais imprima o valor -111.

.data
.text

main:
	#get int1
	li $v0, 5
	syscall
	move $t1, $v0

	#get int2
	li $v0, 5
	syscall
	move $t2, $v0

	#if int2 < int1, printa1
	slt $s0, $t2, $t1
	beq $s0, 1, printa1
	
	#if int1 < int2, printa2
	slt $s0, $t1, $t2
	beq $s0, 1, printa2
	
	#if int1 = int2, printa -111
	#else
	li $a0, -111
	li $v0, 1
	syscall
	j end
	
printa1:
	move $a0, $t1
	li $v0, 1
	syscall
	j end

printa2: 
	move $a0, $t2
	li $v0, 1
	syscall
	j end

end:
li $v0, 10	#end
syscall