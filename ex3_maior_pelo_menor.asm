#Pegue o maior valor e subtraia pelo menor

.data
	p1: .asciiz "Digite o primeiro valor: "
	p2: .asciiz "Digite o segundo valor: "
	res: .asciiz "A diferença do maior pelo menor valor dá "
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
	j fim
	
inverte:
	move $t3, $t1
	move $t1, $t2
	move $t2, $t3

fim:
	sub $t1, $t1, $t2
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 10
	syscall