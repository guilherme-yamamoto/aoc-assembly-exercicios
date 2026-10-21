#comprimento, largura, altura -> volume paralelepípedo

.data
	p1: .asciiz "Digite o comprimento: "
	p2: .asciiz "Digite a largura: "
	p3: .asciiz "Digite a altura: "
	res: .asciiz "O volume do paralelepípedo vale: "
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
	
	li $v0, 4
	la $a0, p3
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0
	
	mul $s1, $t1, $t2
	mul $s1, $s1, $t3
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 10
	syscall