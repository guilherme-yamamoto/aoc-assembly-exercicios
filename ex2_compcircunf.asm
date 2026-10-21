#Receber raio, entregar comprimento, PI vale 3, C = 2 * PI(3) * r

.data
	p1: .asciiz "Digite o raio do círculo: "
	res: .asciiz "O comprimento da circunferência do círculo vale: "
	cm: .asciiz " cm"
.text
.globl main

main:
	li $v0, 4
	la $a0, p1
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	mul $t0, $t0, 6
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, cm
	syscall
	
	li $v0, 10
	syscall
