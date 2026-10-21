#Recebe 10 valores, mostra o menor e o maior deles, se negativo, não aceitar

.data
	p1: .asciiz "Insira um valor: "
	biggest: .asciiz "Maior Valor: "
	smallest: .asciiz "Menor Valor: "
	br: .asciiz "\n"

.text
.globl main

main:
	li $s1, -10000000
	li $s2, 10000000

loop:
	bge $t4, 10, fim
	li $v0, 4
	la $a0, p1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	li $v0, 4
	
	addi $t4, $t4, 1

	bgt $t1, $s1, maior
verifica:
	blt $t1, $s2, menor
	j loop
maior:
	li $v0, 4
	la $s1, ($t1)
	j verifica
menor:
	li $v0, 4
	la $s2, ($t1)
	j loop
fim:
	li $v0, 4
	la $a0, biggest
	syscall
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 4
	la $a0, br
	syscall
	
	li $v0, 4
	la $a0, smallest
	syscall
	
	li $v0, 1
	la $a0, ($s2)
	syscall