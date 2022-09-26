#Faça um programa, em assembly do mips, para somar dois vetores (V1 e V2) onde:
#
#       v1 = {5,10, 15, 20, 25, 30,35,40}
#
#       v2 = {0,10,-15, 16, 20, 30,40,50}
#
#   O programa deverá percorrer os dois vetores, de tamanho 8,
#  somando cada elemento e colocando os mesmos no vetor resultante.
#
#   OBS: Modele primeiro a solução em C depois traduza para assembly   
#
#   Imprima o vetor resultante

.data
	vetor1: .word  5, 10,  15, 20, 25, 30, 35, 40
	vetor2: .word  0, 10, -15, 16, 20, 30, 40, 50
	vetor3r: .word  0,  0,   0,  0,  0,  0,  0,  0
	esp: .asciiz " "
.text

main:
	la $s1, vetor1		#s1 = vetor1
	la $s2, vetor2		#s2 = vetor2
	la $s3, vetor3r		#s3 = vetor3r
	#s4			$s4 = [temp] posicao s3
	la $s5, esp		#s5 = " "
	
	###########
	li $t5, 0		#t5 = i
	#t6			#t6 = t5 * 4
	
	#t1			#t1 = valor vetor1
	#t2			#t2 = valor vetor2
	#t3			#t3 = valor vetor3
	
repeat:
	sll $t6, $t5, 2		#t6 = t5 * 2^2
	
	#get valor vetor1
	add $t1, $t6, $s1
	lw $t1, 0($t1)
	#get valor vetor2
	add $t2, $t6, $s2
	lw $t2, 0($t2)
	
	#valor vetor1 + valor vetor2 = valor vetor 3
	add $t3, $t1, $t2
	#find position vetor3
	add $s4, $s3, $t6
	#save valor vetor 3 -> vetor 3
	sw $t3, 0($s4)

	#i++
	addi $t5, $t5, 1
	
	#if i > 7, end
	sgt $t7, $t5, 7
	beq $t7, 1, end

	j repeat
	

end:
		#for x=0, x < 8, x++
		li $t0, 8		#x max
		li $t5, 0		#x
	printarepeat:
		sll $t6, $t5, 2		#t6 = t5 * 2^2
		
		#*s4 = s3[t6]
		add $s4, $s3, $t6
		#t3 = s4
		lw $t3, 0($s4)
		
		#print t3
		move $a0, $t3
		li $v0, 1
		syscall
		
		#print " "
		move $a0, $s5
		li $v0, 4
		syscall
		
		addi $t5, $t5, 1
		#if x < 8, printarepeat
		#t5 < t0
		slt $t7, $t5, $t0
		beq $t7, 1, printarepeat
	
#end
li $v0, 10
syscall
