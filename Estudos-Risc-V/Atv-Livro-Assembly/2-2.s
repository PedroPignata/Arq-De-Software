# Este código traduz uma expressão C complexa em várias instruções RISC-V simples.
# Supondo que f, g, h, i, e j estejam nos registradores x5, x6, x7, x28, e x29, respectivamente.

#  Traduzindo a expressão em C:  f = (g + h) - (i + j) para RISC-V.

add t0, x6, x7    # t0 = g + h  (Adiciona g e h e armazena em um registrador temporário)
add t1, x28, x29  # t1 = i + j  (Adiciona i e j e armazena em outro registrador temporário)
sub x5, t0, t1    # x5 = t0 - t1 (f = (g + h) - (i + j))