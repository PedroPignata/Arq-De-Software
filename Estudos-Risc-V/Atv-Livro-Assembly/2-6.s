# Supondo que x5 contém 0xABCDEF12. Vamos extrair os bits 15-8.
# Para fazer isso, usamos uma máscara e shifts.

# Usando shifts:
slli t0, x5, 16      # Desloca x5 16 bits para a esquerda. t0 = 0xCDEF1200
srli t0, t0, 24      # Desloca t0 24 bits para a direita. t0 = 0x000000CD

# Usando AND com uma máscara:
andi t1, x5, 0x0000FF00 # Usa uma máscara para isolar os bits 15-8. t1 = 0x0000CD00
srli t1, t1, 8       # Desloca t1 8 bits para a direita. t1 = 0x000000CD