#int fat(int n){
#	if(n < 1)
#		return 1;
#	else return (n * fat(n - 1);
#}

data:
text:

main:
	li $a0, 5		#n = 5
	jal fat			#ra = aqui
	
	move $a0, $v0		#manda result pra a0
	li $v0, 1		#printa a0
	syscall
	
	li $v0, 10		#termina programa
	syscall
	
fat:
	addi $sp, $sp, -8
	sw $a0, 4($sp)		#salva n pro stack
	sw $ra, 8($sp)		#salva ra pro stack
	
	slti $t0, $a0, 1	#n < 1? -> 1
	beq $t0, $zero, L1	#se 0, pula pra L1
	
	li $v0, 1		#se n = 1 (pois t0 sera 1), define result como 1
	addi $sp, $sp, 8	#retorna stack
	jr $ra			#volta pro ultimo jal
	
L1:
	addi $a0, $a0, -1	#n--
	jal fat			#RECURSAO
	
	lw $a0, 4($sp)		#pega o ultimo a0 do stack
	lw $ra, 8($sp)		#pega o ultimo jal do stack
	addi $sp, $sp, 8	#retorna stack
	
	mul $v0, $v0, $a0	#multiplica fat
	jr $ra			#volta pro ultimo jal