.data

msg_numero: .asciiz "Digite um número: "
msg_resultado: .asciiz "O resultado da operação é: "

numero: .word 0
resultado: .word 0

.text
.globl main

main:
   
    li $v0, 4
    la $a0, msg_numero
    syscall
    li $v0, 5
    syscall
    sw $v0, numero

   
    lw $t0, numero

   
    bgez $t0, eh_positivo 
    j eh_negativo  

eh_positivo:
   
    add $t1, $t0, $t0
    sw $t1, resultado
    j imprimir_resultado

eh_negativo:
   
    li $t2, 3
    mul $t1, $t0, $t2
    sw $t1, resultado
imprimir_resultado:
   
    li $v0, 4
    la $a0, msg_resultado
    syscall
    lw $a0, resultado
    li $v0, 1
    syscall

   
    li $v0, 10
    syscall