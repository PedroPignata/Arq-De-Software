# strlen.s
.globl strlen
.type strlen, @function

strlen:
    # Inicializa o contador de caracteres (len) em a1.
    li a1, 0

loop:
    # Carrega o byte do endereço apontado por a0 para o registrador a2.
    lbu a2, 0(a0)
    # Verifica se o caractere carregado (em a2) é o caractere nulo '\0' (0).
    beq a2, x0, end
    # Se não for o caractere nulo, incrementa o ponteiro da string.
    addi a0, a0, 1
    # Incrementa o contador de caracteres.
    addi a1, a1, 1
    # Volta para o início do loop para processar o próximo caractere.
    j loop

end:
    # Movemos o resultado para a0, que é o registrador de retorno padrão de uma função.
    mv a0, a1
    # Retorna da função.
    ret