# Esta é a rotina principal (caller) que chama a função 'my_function'.
main:
li a0, 10                # Argumento 1: 10
li a1, 20                # Argumento 2: 20
jal ra, my_function      # Chama my_function e salva o endereço de retorno em ra
# ... Código depois do retorno ...

# Esta é a rotina de my_function (callee)
my_function:
add a0, a0, a1           # a0 = 10 + 20. O resultado é colocado no registrador de retorno.
jalr zero, ra, 0         # Retorna para o endereço em ra