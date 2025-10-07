# Este código acessa um elemento de um array A e o soma com uma variável h.
# Supondo que h está no registrador x6 e o endereço base de A está em x7.

# A[12] = h + A[8];

lw  t0, 32(x7)       # Carrega A[8] (endereço base + 8*4 bytes) para o registrador t0
add t0, x6, t0       # Soma o valor de h (em x6) com A[8] e armazena em t0
sw  t0, 48(x7)       # Armazena o resultado de volta em A[12] (endereço base + 12*4 bytes)