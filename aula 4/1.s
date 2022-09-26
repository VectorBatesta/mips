.data
	save: .word 1, 1, 1, 1, 1, 10
.text


main:
	#load address
	la $a0, save
	
	
	li $s0, 0
	li $s1, 1
	
	while:
		add $t0, $a0, $s0	#t0 = vetor a0[s0]
		lw $t1, 0($t0)		#t1 = t0  /\
		bne $t1, $s1, sair	#if t1 =/= s1 (s1 = 1), goto sair
		addi $s0, $s0, 4	#s0 ++ 4 (uma casa pra frente)
		
		j while		#goto while (repete)
	sair:
	
	li $v0, 1	#v0 = 1 quer dizer "printa a0"
	move $a0, $s0	#a0 = casa de s0
	syscall		#chama v0
	
	li $v0, 10	#v0 = 10 quer dizer "sair"
	syscall		#chama v0
