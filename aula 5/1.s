.data
	save: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10
.text


main:
	la $s6, save		#salvando o vetor em s6

	li $s3, 0		#setando variavel s3 como zero
	li $s5, 1		#setando variavel s5 como 1

	
Loop:
	sll $t0, $s3, 2		#soma variavel s3 com n^2 que no caso está como 2, entao x4
	add $t0, $t0, $s6	#recebe valor de save na casa t0
	lw $t1, 0($t0)		#t1 = valor de save na casa t0 (save[t0])
	bne $t1, $s5, Sair	#verifica se t1 =/= s5, se for diferente ele sai do loop
	addi $s3, $s3, 1	#aumenta 1 na variavel s3
	
	j Loop			#volta no loop se t1 = s5
Sair:
	li $v0, 1		#proximas 3 linhas: printa s3 apos terminar o loop
	move $a0, $s3
	syscall
