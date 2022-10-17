.data
array: .word 7, 4, -6, 1, -2, 0

.text

.globl main

main:
	la $s0, array # endereço base do array
	subi $s6, $s0, 4 # servirá como o k = -1
	li $t0, 0 # i = 0
	li $t1, 5 # tamanho do vetor
	li $t2, 4 # $t4 servirá para indicar a posição no array
	
loop1:
	beq $t0, $t1, exit1 # se $t0 == $t1, vá para exit1
	
	add $s1, $s0, $t2 # somatório para encontrar o endereço do valor do índice
	subi $s2, $s1, 4 # subtração para encontrar o endereço do valor anterior ao indice.
	
	lw $t3, ($s1) # valor do endereço
	
loop2:
	beq $s2, $s6, exit2 # certifica se, ao comparar com o valor da esquerda, não estamos
		            # comparando com um valor fora do array.
		         
	lw $t4, ($s2) # valor do endereço.

	slt $t9, $t3, $t4 # $t3 < $t4?
	beq $t9, $zero, exit2 # se sim, pule para exit2
	
	sw $t4, 4($s2) # aqui, iremos empurrar o valor para a direita.
	
	subi $s2, $s2, 4 # encontra o endereço do valor a esquerda.

	j loop2

exit2:
	sw $t3, 4($s2)
	addi $t2, $t2, 4 # incremento do índice
	addi $t0, $t0, 1 # incremento de i
	
	j loop1
	
exit1:
	li $v0, 10
	syscall
