.globl main

.data
	NaoPrimo: .asciiz "O modulo nao eh primo."
	Resultado: .asciiz  "O inverso multiplicativo eh "
.text

main:

	li $s0, 1  # Incementador i
	li $s1, 0  #incrementador p	
	li $t5, 0  # inicializando o resto

le_inteiro:

	li $v0, 5  #armazenado o Primeiro numero do usuario no registrador
	syscall
	
	move $t0, $v0 # movendo o numero para o registrador $t0, agora $t0 é o Primeiro Numero
	
	li $v0, 5  #armazenado o Segundo numero do usuario no registrador
	syscall
	
	move $t1, $v0 ## movendo o numero para o registrador $t1, agora $t1 é o Segundo Numero


eh_primo:
	
	
	beq $s0, $t0, decidir  #Compara os valores  de i e o total, caso forem iguais, ele sai do loop
	
	### Calculo do resto de uma divisao -> resto = dividendo - (divisor * quociente)
	
	div $t0, $s0, #Divisão do 1ºNumero (dividendo) pelo i (divisor)
	mflo $s3 	#guarda o resultado (quociente) da divisão em um registrador de baixo nivel
	
	
	mult $s0, $s3	#Multiplica o i(divisor) pelo quociente
	mflo $s4	#guarda o resultado em um registrador de alto nivel
	
	 
	sub $t6, $t0, $s4  #subtrai o 1ºNumero pelo resultado da multiplicação e armazena no $t6 que é o resto
	
	 ### FIm do calculo do resto 
	
	addi $s0, $s0, 1 #Incrementando o i
	
	bnez $t6, eh_primo  #Se o resto for difetente de 0, ele volta pra o inicio
	addi $s1, $s1, 1  #Incrementando o p, que servira para sabermos se é primo ou não
	
	j eh_primo  # retorna para o eh_primo

decidir:

	beq $s1, 1, calc_inverso  # Se  "p" for igual a 2 ele é primo, pois os numeros primos são multiplos de apenas 2 numeros
	bne $s1, 1, imprime_erro  # Se "p" for diferente de 2 ele não é primo, pois possui mais de 2 multiplos 
		
calc_inverso:
	
	j exit

imprime_erro:

	li $v0, 4 	#comando para o syscall printar uma string
	la $a0, NaoPrimo  #Carrega a Label NaoPrimo
	syscall  # Chamada de sistema
	j exit  #Termina o programa
	
imprime_saida:
	
	li $v0, 4  	##comando para o syscall printar uma string
	la $a0, Resultado # Chamada de sistema
	syscall		# Chamada de sistema
	j exit  #Termina o programa
	
exit: