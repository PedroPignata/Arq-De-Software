# Trecho C: for (i = 0; i < n; i += 1) { ... }
# Supondo i no registrador s0 e n em s3.

li   s0, 0                 # i = 0
loop_start:
blt  s0, s3, loop_body     # Se i < n, desvia para o corpo do loop
j    loop_end              # Caso contrário, sai do loop
loop_body:
# ... corpo do loop ...
addi s0, s0, 1             # i += 1
j    loop_start            # Volta ao início do loop
loop_end:
# Fim do loop