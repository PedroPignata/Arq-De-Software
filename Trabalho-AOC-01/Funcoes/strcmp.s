.global strcmp
.type strcmp, @function

strcmp: 
     # a0 = ponteiro para s1
    # a1 = ponteiro para s2
    # t0 = caractere de s1
    # t1 = caractere de s2
    # a3 = diferença (Resultado: s1 - s2)


loop: 
    # Careegamos um byte de cada string
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    # Comparamos os caracteres por subtração
    sub a3, t0, t1
    # Se a3 for nulo chegamos no fim da string dele
    bne a3, x0, end0 
    # Se a difrença for zero eles  são iguais
    # Verificação se chugou no fim da string
    beq t0, x0, end

    addi a0, a0, 1
    addi a1, a1, 1
    
    j loop

end0:
    mv a0, a3 
    ret

end: 
    mv a0, x0
    ret
