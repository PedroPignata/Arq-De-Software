# No RISC-V, a maioria das operações aritméticas padrão (como 'add')
# não causa overflow para os registradores de 32 bits, comportando-se como se fossem sem sinal.
# No entanto, a linguagem assembly RISC-V distingue entre operações com e sem sinal
# para comparação e desvios. O exemplo abaixo mostra isso.

# Supondo que x5 = 0x80000000 e x6 = 0x80000000

add x5, x5, x6      # x5 = x5 + x6. O resultado em x5 será 0x00000000 (comportamento de complemento de dois).
sltu t0, x5, x6     # Se x5 < x6 como sem sinal, t0 = 1. Nesse caso, t0 = 0.
blt x5, x6, branch_label # Desvia se x5 < x6 como com sinal. Nesse caso, não desvia.