.text
.globl main

main: 
    addi a0, x0, 4        # a0 = 4 (Define N)
    jal ra, fatorial      # Chama fatorial(4)
    li a7, 93             # Código da syscall 'exit' (93)
    ecall                 # Termina o QEMU com o resultado de a0 (24)

fatorial:
    addi sp, sp, -8       # Aloca 8 bytes na pilha
    sw ra, 4(sp)          # Salva o endereço de retorno
    sw a0, 0(sp)          # Salva o valor atual de N (a0)

    beq a0, zero, r1      # if (a0 == 0) -> vai para r1
    
    addi a0, a0, -1       # a0 = N - 1

    jal ra, fatorial      # fatorial(n-1)

    lw t0, 0(sp)          # t0 = N original (restaura o N salvo)
    mul a0, t0, a0        # a0 = N * (N-1)!
    jal x0, return        # Desvia para o retorno

r1:
    li a0, 1              # a0 = 1 (Caso base: 0!)

return:
    lw ra, 4(sp)
    addi sp, sp, 8
    jalr x0, 0(ra)