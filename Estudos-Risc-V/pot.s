#   Exemplo de função recursiva para calcular potência    
#   int pot(int base, int exp) {
#   if(exp == 0) return 1;
#   return base * pot(base, exp - 1);
#   }

.text                 
.data                   
.globl main             

# a0 = argumento 0 (base) e registrador de retorno
# a1 = argumento 1 (expoente)
# ra = endereço de retorno
# sp = stack pointer (ponteiro de pilha)
# t0 = temporário

main:

    addi a0, x0, 2      # Define a base (a0 = 2)
    addi a1, x0, 5      # Define o expoente (a1 = 5)

pot:
    # Aloca 8 bytes (2 palavras de 4 bytes) na pilha,fazendo a pilha "crescer" para endereços mais baixos.
    addi sp, sp, -8    
    # Salva o Endereço de Retorno (ra) na pilha.
    sw ra, 4(sp) 
    # Salva a Base original (a0) na pilha.
    sw a0, 0(sp) 
    # Verifica se o expoente (a1) é igual a zero (zero = x0). Se a1 == 0 (base^0), desvia para 'r1'.
    beq a1, zero, r1
    # Redução do problema: (exp = exp - 1)
    addi a1, a1, -1
    # Chama a função 'pot' novamente (pot(base, exp-1)).
    jal ra, pot
    # Restaura a Base (x) salva na pilha para o registrador temporário t0.
    # 'a0' agora contém o resultado da chamada recursiva (base^(exp-1)).
    lw t0, 0(sp)
    # a0 = a0 * t0  => a0 = (base^(exp-1)) * base
    mul a0, a0, t0 
    # Desvio incondicional para o Epílogo (return).
    jal x0, return

r1:
    # Carrega o valor 1 no registrador de retorno (a0).
    li a0, 1

return:
    # Restaura o Endereço de Retorno (ra) que estava salvo na pilha.
    lw ra, 4(sp)
    # Desaloca os 8 bytes da pilha, restaurando o sp ao seu valor anterior.
    addi sp, sp, 8   
    # Retorna para o chamador (instância anterior de 'pot' ou 'main').
    jalr x0, 0(ra)
