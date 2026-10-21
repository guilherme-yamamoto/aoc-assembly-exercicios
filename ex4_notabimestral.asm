#Receber 4 notas de aluno, calcular a média, se acima de 6 APROVADO, de 3 a 5,9 EXAME, abaixo de 3 RETIDO

.data
	p1: .asciiz "Digite a primeira nota: "
	p2: .asciiz "Digite a segunda nota: "
	p3: .asciiz "Digite a terceira nota: "
	p4: .asciiz "Digite a quarta nota: "
	res: .asciiz "Com a sua média atual de: "
	res2: .asciiz "\nO seu status é: "
	apr: .asciiz "APROVADO"
	exa: .asciiz "EXAME"
	ret: .asciiz "RETIDO"
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
	
	li $v0, 4
	la $a0, p4
	syscall
	
	li $v0, 5
	syscall
	
	move $t4, $v0
	
	add $t1, $t1, $t2
	add $t1, $t1, $t3
	add $t1, $t1, $t4
	div $t1, $t1, 4
	
	li $v0, 4
	la $a0, res
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 4
	la $a0, res2
	syscall
	
	bge $t1, 6, passou
	bge $t1, 3, recuperacao
	blt $t1, 3, reprovou
	
passou:
	li $v0, 4
	la $a0, apr
	syscall
	j fim

recuperacao:
	li $v0, 4
	la $a0, exa
	syscall
	j fim

reprovou:
	li $v0, 4
	la $a0, ret
	syscall
	j fim

fim:
	li $v0, 10
	syscall