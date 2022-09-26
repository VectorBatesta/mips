#    scanf("%i", a);
#    scanf("%i", b);
#    x = 0;
#    if ( a < -5 && b >= 15 )
#         x = 10;
#    printf("%i", x);

.data
.text

main:
	#get int1
	li $v0, 5
	syscall
	move $t1, $v0		#t1 = int1
	
	#get int2
	li $v0, 5
	syscall
	move $t2, $v0		#t2 = int2
	
	#define x = 0
	li $t3, 0		#x

	#if int1<-5 AND 14<int2,
	#define x = 10
	li $s1, -5		#a
	li $s2, 14		#b
	
	#int1 < -5
	#t1   < s1
	slt $s0, $t1, $s1
	bne $s0, 1, end
	#define x = 10
	li $t3, 10
	j end
	
	#14   < int2
	#s2   < t2
	slt $s0, $s2, $t2
	bne $s0, 1, end
	#define x = 10
	li $t3, 10
	j end
	
end:
	#print x	
	move $a0, $t3
	li $v0, 1
	syscall


li $v0, 10 #sair
syscall