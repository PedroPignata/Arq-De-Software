.global strcmp
.type strcmp, @function

strcmp: 
    # a0 = ponteiro para s1
    # a1 = ponteiro para s2
    # t0 = caractere de s1
    # t1 = caractere de s2

loop: 
    # Careegamos um byte de cada string
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    # Comparamos os caracteres por subtração
    sub a0, t0, t1
    # Se a difrença for zero eles  são iguais
    # Verificação se chugou no fim da string
    beq a0, x0, next
    
    ret

next:
    # Se t0 for nulo chegamos no fim da string dele
    beq t0, x0, end
    # Se não for avança um caractere
    addi a0, a0, 1
    addi a1, a1, 1
    
    j loop

end: 
    # Retorna para a0(0)
    ret
