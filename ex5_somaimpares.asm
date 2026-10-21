#Receba 2 inteiros, veja o maior, calcule a soma dos números ímpares entre esses valores

.data
	p1: .asciiz "Insira o primeiro valor: "
	p2: .asciiz "Insira o segundo valor: "
	res: .asciiz "A soma dos valores ímpares entre os dois valores digitados dá: "
.text
.globl main

main:
	li $v0, 4
	la $a0, p1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	li $v0, 4
	la $a0, p2
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	blt $t1, $t2, inverte
	
	#Para não considerar o valor inicial como um ímpar, pois é apenas entre os valores, sem eles inclusos
	addi $t2, $t2, 1
	j impares
	
inverte:
	move $t3, $t1
	move $t1, $t2
	move $t2, $t3
	#Para não considerar o valor inicial como um ímpar, pois é apenas entre os valores, sem eles inclusos
	addi $t2, $t2, 1
		
impares:
	bge $t2, $t1, fim
	rem $t3, $t2, 2
	bnez $t3, soma
	addi $t2, $t2, 1
	j impares
soma: 
	add $t4, $t4, $t2
	addi $t2, $t2, 1
	j impares
	
fim:
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	la $a0, ($t4)
	syscall

	li $v0, 10
	syscall