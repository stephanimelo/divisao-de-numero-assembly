.data

num1: .word 0
num2: .word 0
resultado: .word 0
msg_dividendo: .asciiz "Digite o primeiro número: "
msg_divisor: .asciiz "Digite o segundo número (não pode ser zero): "
msg_resultado: .asciiz "Resultado da divisão: "

.text
.globl main

main:
    
    li $v0, 4
    la $a0, msg_dividendo
    syscall
    li $v0, 5
    syscall
    sw $v0, num1

solicita_divisor:
    
    li $v0, 4
    la $a0, msg_divisor
    syscall
    li $v0, 5
    syscall
    sw $v0, num2

    lw $t1, num2

    beqz $t1, solicita_divisor 

    lw $t0, num1

    div $t0, $t1
    mflo $t2  ultado

    li $v0, 4
    la $a0, msg_resultado
    syscall
    move $a0, $t2 
    li $v0, 1
    syscall

    li $v0, 10
    syscall
