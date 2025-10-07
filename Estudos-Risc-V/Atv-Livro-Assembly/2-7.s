# C code: if (i == j) f = g + h; else f = g - h;
# Supondo que i, j, f, g, e h estejam nos registradores x28, x29, x5, x6, e x7.

bne x28, x29, else_label    # Se i != j, desvia para 'else_label'
add x5, x6, x7              # f = g + h (bloco 'if')
j exit_label                # Desvia para o fim (evita o 'else')
else_label:
sub x5, x6, x7              # f = g - h (bloco 'else')
exit_label:
# Fim da instrução condicional. O código continua aqui.