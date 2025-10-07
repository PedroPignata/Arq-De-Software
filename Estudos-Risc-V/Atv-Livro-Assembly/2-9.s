# Este código copia uma string do endereço em a1 para o endereço em a0.
# A string termina com o caractere nulo ('\0').

loop_copy:
lbu  t0, 0(a1)           # Carrega 1 byte (caractere) da string de origem para t0
sb   t0, 0(a0)           # Armazena o byte na string de destino
beq  t0, zero, end_copy  # Se o byte for nulo, a cópia está completa
addi a0, a0, 1           # Incrementa o ponteiro da string de destino
addi a1, a1, 1           # Incrementa o ponteiro da string de origem
j    loop_copy           # Volta ao início do loop
end_copy:
# A string foi copiada