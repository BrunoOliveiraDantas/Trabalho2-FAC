.globl main

.data
	NaoPrimo: .asciiz "O modulo nao eh primo."
	Resultado: .asciiz  "O inverso multiplicativo eh "
.text

main:

	li $s0, 1  # Incementador i
	li $s1, 0  #incrementador p	
	

le_inteiro:

	li $v0, 5  #armazenado o Primeiro numero do usuario no registrador
	syscall
	
	move $t0, $v0 # movendo o numero para o registrador $t0, agora $t0 é o Primeiro Numero
	
	li $v0, 5  #armazenado o Segundo numero do usuario no registrador
	syscall
	
	move $t1, $v0 ## movendo o numero para o registrador $t1, agora $t1 é o Segundo Numero

eh_primo:

	
	
	
calc_inverso:

imprime_erro:

	li $v0, 4
	la $a0, NaoPrimo
	syscall

imprime_saida:
	
	li $v0, 4
	la $a0, Resultado
	syscall

exit: