# Versão em assembly RISC-V do exemplo C (remover negativos de um vetor)
#
# Função C original (comentada):
# int remove_negatives(int *arr, size_t size) {
#     size_t new_size = 0;
#     for (int i = 0; i < size; i++) {
##         if (arr[i] >= 0) {
#             a[new_size] = arr[i];
#             new_size++;
#         }
#     }
#     return new_size;
# }

.data
.globl  main  

main:
    # a0 -> ponteiro para o array (arr)
    # a1 -> tamanho do array (size)
    # a2 -> new_size 
    addi a2, x0, 0      # new_size = 0 (registrador a2)
    addi t0, x0, 0      # i = 0 (contador em t0)

loop:
    
    bge t0, a1, return  # if (i >= size) testa se i >= size -> se sim, vai para return

    add t2, t0, t0      # t2 = i * 2
    add t2, t2, t2      # t2 = (i*2) + (i*2) = i * 4

    lw t1, 0(a0, t2)    # carregar arr[i] em t1: lw t1, offset(a0), t1 = arr[i]

    blt t1, x0, endif   # if (t1 < 0)

    add t3, a2, a2      # t3 = new_size * 2
    add t3, t3, t3      # t3 = new_size * 4
    sw t1, 0(a0, t3)    # a[new_size] = t1
    addi a2, a2, 1      # new_size++

endif:
    addi t0, t0, 1      # i++
    jal x0, loop        # salto incondicional para loop (jal x0 = jump)

return:
    addi a0, a2, 0      # mover new_size para a0 como valor de retorno
    jalr x0, 0(ra)      

