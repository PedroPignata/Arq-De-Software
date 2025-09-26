.globl
.type strcat, @function

strcat:
    # Copia o valor original de a0 para a5
    mv a5, a0
    
loop:
    # Carrega o byte atual de dest (a0) para t0
    lbu t0, 0(a0)
    
    beq t0, x0, loop2
    # Se não for o terminador, avança o ponteiro de dest
    addi a0, a0, 1

    j loop

loop2:
    # Carrega um byte da string de origem (src)
    lbu t0, 0(a1)
    sb t0, 0(a0)
    beq t0, x0, end
    # Incrementa os dois ponteiros para o próximo byte
    addi a0, a0, 1
    addi a1, a1, 1

    j loop2

end:
    mv a0,a5
    ret

