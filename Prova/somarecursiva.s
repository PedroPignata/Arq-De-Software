# Soma Recursiva em C

# int sum_to_n(int n) {
## if (n == 0) return 0;
# return n + sum_to_n(n - 1);
# }

.data
.globl main

main: 

    addi a0, x0, 4 # a0 = 4 (Define N)
    jal ra, soma   # Chama a função soma (sum_to_n(4))       

    li a7, 93       
    ecall   
# Entrada: a0 = n
# Saída: a0 = soma(1..n)
soma:

    addi sp, sp, -8       # Aloca 8 bytes na pilha
    sw ra, 0(sp)          # Salva o endereço de retorno (ra)
    sw a0, 4(sp)          # Salva o valor original de n (a0)
    # Verifica o valor atual de n (a0)
    beqz a0, r0           # Se a0 == 0, salta para o rótulo r0. 
    # 1. Prepararaçao do argumento para a próxima chamada: n - 1
    addi a0, a0, -1       # a0 = n - 1
    
    # 2. Chamada recursiva
    jal ra, soma          # Chama soma(n - 1).

    lw t0, 4(sp)          # Carrega o valor original de n da pilha para t0
    add a0, a0, t0        # a0 = a0 (soma 1..n-1) + t0 (n)
    j return              # Salta para o epílogo

r0:
    addi a0, x0, 0  
    j return              # Salta para o epílogo

return:
    lw ra, 0(sp)          # Restaura o endereço de retorno (ra)
    addi sp, sp, 8        # Desaloca a pilha
    jalr x0, ra, 0
              