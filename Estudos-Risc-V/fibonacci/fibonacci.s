.text
.globl main

main:
    li a0, 6              # N = 6. Resultado esperado: F(6) = 8
    jal ra, fibonacci     # Chama fibonacci(6)

    li a7, 93             # a7 = Código da syscall 'exit' (93)
    ecall                 # Termina o QEMU com o resultado de a0 (8)

fibonacci:
    addi sp, sp, -16    # Aloca 16 bytes na pilha
    sw ra, 12(sp)         # Salva o endereço de retorno
    sw a0, 8(sp)          # Salva N original (Argumento)

    # --- CASO BASE 1: F(0) = 0 ---
    beq a0, zero, r0      # Se N == 0, salta para r0
    # --- CASO BASE 2: F(1) = 1 ---
    li t0, 1                 
    beq a0, t0, r1        # Se N == 1, salta para r1

    # --- 1ª CHAMADA: F(n-1) ---
    addi a0, a0, -1       # a0 = N - 1
    jal ra, fibonacci     # Chama fibonacci(n-1). Resultado em a0
    # --- SALVA F(n-1) E PREPARA PARA A 2ª CHAMADA ---
    sw a0, 4(sp)          # Salva o resultado de F(n-1) na pilha
    lw a0, 8(sp)          # Restaura N original em a0 para a segunda chamada
    # --- 2ª CHAMADA: F(n-2) ---
    addi a0, a0, -2       # a0 = N - 2
    jal ra, fibonacci     # Chama fibonacci(n-2). Resultado em a0.

    # --- SOMA E RETORNO ---
    lw t1, 4(sp)          # t1 = Resultado de F(n-1)
    add a0, a0, t1        # a0 = F(n-2) + F(n-1)

    jal x0, return        # Desvia para o epílogo

r0:
    # F(0) = 0
    li a0, 0
    jal x0, return

r1:
    # F(1) = 1
    li a0, 1
    # Não precisa de jal, cai direto no return

return:
    lw ra, 12(sp)         # Restaura o endereço de retorno
    addi sp, sp, 16       # Desaloca 16 bytes da pilha
    jalr x0, 0(ra)        # Retorna ao chamador