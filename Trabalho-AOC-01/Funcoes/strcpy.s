.globl strcpy
.type strcpy, @function

strcpy:
    # Salva o valor original de a0 em a5
    mv a5, a0

loop:

    # Carrega um byte da string de origem (src), que está em a1
    lbu a2, 0(a1)
    # Armazena o byte lido (a2) na string de destino (dest), que está em a0
    sb a2, 0(a0)
    # Verifica se o byte lido é o caractere nulo '\0' (0)
    beq a2, x0, end
    # Incrementa os dois ponteiros para apontar para o próximo byte
    addi a0, a0, 1 # Incrementa o ponteiro de dest
    addi a1, a1, 1 # Incrementa o ponteiro de src

    j loop

end:
    # Move o valor original de dest(a5) para a0
    mv a0, a5
    ret
