# C code: for (p = &array[0]; p < &array[size]; p = p + 1) *p = 0;
# Supondo o endereço base do array em a0 e o tamanho em a1.
# O ponteiro p é mantido em t0.

slli t1, a1, 2          # t1 = size * 4 (converte tamanho para bytes)
add  t2, a0, t1         # t2 = endereço final do array
mv   t0, a0             # t0 = p = &array[0]

loop_zero:
sw   zero, 0(t0)        # *p = 0 (armazena 0 no endereço apontado por t0)
addi t0, t0, 4          # p = p + 4 (incrementa o ponteiro para o próximo word)
blt  t0, t2, loop_zero  # Continua enquanto p < &array[size]