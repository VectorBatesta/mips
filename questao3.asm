#(1,0) a) Faça um programa, em assembly do MIPS, que receba e multiplique
#dois inteiros sem usar a instrução de multiplicação do MIPS. Imprima o resultado na tela.

#(2,0) b) O programa deverá funcionar tanto para inteiros positivos quanto para inteiros
#negativos.

.data
.text

main:
	#t1		#t1 = int1
	#t2		#t2 = int2
	li $t3, 0	#t3 = t, começa com 0
	li $t4, 0	#t4 = result

	#get int1
	li $v0, 5
	syscall
	move $t1, $v0
	
	#if int1 = zero, end
	beqz $t1, end
	
	#if int1 < 0, t++, set positive
	slt $s0, $t1, $zero
	beq $s0, 0, skip1
	#t++, set positive
	addi $t3, $t3, 1
	sub $t1, $zero, $t1
	
	skip1:
	#get int1
	li $v0, 5
	syscall
	move $t2, $v0
	
	#if int2 = zero, end
	beqz $t2, end
	
	#if int2 < 0, t++, set positive
	slt $s0, $t2, $zero
	beq $s0, 0, skip2
	#t++, set positive
	addi $t3, $t3, 1
	sub $t2, $zero, $t2
	
	skip2:
	
	#multiplicar
	repeat:
		add $t4, $t4, $t1
		subi $t2, $t2, 1
		bne $t2, 0, repeat
	
	#if t3=0, ambos positivos	result positivo
	#if t3=1, um deles é negativo,	result NEGATIVO
	#if t3=2, ambos negativos	result positivo
	bne $t3, 1, end
	#set negative
	sub $t4, $zero, $t4
	
	end:
	#print result
	li $v0, 1
	move $a0, $t4
	syscall
	
#end
li $v0, 10
syscall