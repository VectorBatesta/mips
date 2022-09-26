.data
	buffer: .space 20 #5 palavras
	
	
.text


main:
	li $v0, 5		#v0 em 5 -> salva input teclado em v0
	syscall
	
	li $s0, 10		#variavel aleatoria = 10
	beq $v0, $s0, igualdez	#se v0  =  s0, igualdez:
	bne $v0, $s0, naoigual	#se v0 =/= s0, naoigual:



igualdez:
	move $a0, $v0		#imprime o valor
	li $v0, 1
	syscall
	
	j end
	
naoigual: 
	li $a0, 0		#imprime zero
	li $v0, 1
	syscall

end:
	li $v0, 10		#fecha
	syscall
