.global strncmp
.type strncmp, @function

strncmp:

    # a0 = ponteiro para s1
    # a1 = ponteiro para s2
    # a2 = número máximo de caracteres a comparar (n)

loop:
    # Checar se n(a2) é 0, se for para e retorna a 0
    beq a2, x0, endn
    # Carrega um byte de cada string
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    # Compara os caracteres por subtração, para ver se é o fim
    sub a3, t0, t1
    # Se for diferente de zero retorna a diferença
    bne a3, x0, endsub
    # Se for zero são iguais, ai checa se t0 é '\0'(O fim da string)
    beq t0, x0, endn
    #avança os ponteiros
    addi a0, a0, 1
    addi a1, a1, 1
    # Decrementa n
    addi a2, a2, -1
    
    j loop


endsub:
    # Retorna a diferença
    mv a0, a3
    ret

endn:
    mv a0, x0
    ret
