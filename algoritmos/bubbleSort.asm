.data
array: .word 7, 4, -6, 1, -2, 0

.text

.globl main

main:
	li $t0, 0 # i = 0
	li $t1, 5 # tamanho do vetor/restri��o para o la�o externo
	li $t2, 0 # j = 0
	la $s0, array # endere�o base do array
	
loop1:
	beq $t0, $t1, exit1 # $t0 == $t1
	
	li $t2, 0 # zerando j
	sub $t3, $t1, $t0  # restri��o para o la�o interno (tam - i)
	li $t4, -4 # $t4 servir� para indicar a posi��o no array

	
loop2:
	beq $t2, $t3, exit2 # $t2 == $t3
	
	addi $t4, $t4, 4 # soma 4 para avan�ar uma posi��o a cada rodada no la�o
	addi $t5, $t4, 4 # $t5 servir� para acessar o elemento da posi��o posterior no array
	
	li $s1, 0 # zerando $s1 para que ele receba um endere�o
	li $s2, 0 # zerando $s2 para que ele receba um endere�o
	
	add $s1, $s0, $t4 # encontra-se o endere�o da posi��o atual do array
	add $s2, $s0, $t5 # encontra-se o endere�o da posi��o seguinte a atual do array
	
	lw $s4, 0($s1) # armazena-se o valor da posi��o atual
	lw $s5, 0($s2) # armazena-se o valor da posi��o seguinte
	
	slt $t6, $s4, $s5 # $s4 < $s5 ?
	bne $t6, $zero, ELSE
	
	# os valores ser�o trocados
	sw $s4, 0($s2)
	sw $s5, 0($s1)
	
ELSE:
	addi $t2, $t2, 1 # incremento de j
	j loop2
	
exit2:
	addi $t0, $t0, 1 # incremento de i
	j loop1
	
exit1:
	li $v0, 10
	syscall

