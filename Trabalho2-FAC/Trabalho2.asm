.data

.text

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

imprime_saida: