# Este código incrementa atomicamente um valor na memória.
# Supondo que o endereço da variável 'shared_counter' está em a0.

try_again:
lr.w t0, (a0)           # Carrega o valor do contador de forma 'linked'
addi t0, t0, 1          # Incrementa o valor em 1
sc.w t1, t0, (a0)        # Tenta armazenar o novo valor de forma 'conditional'
bnez t1, try_again      # Se o armazenamento falhar, t1 != 0, então tentamos novamente.
# Se o armazenamento for bem-sucedido, o código continua aqui.