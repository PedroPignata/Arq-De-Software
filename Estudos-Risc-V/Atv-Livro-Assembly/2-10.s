# Carrega a constante 0xABCD1234 no registrador t0.

lui t0, 0xABCD        # t0 = 0xABCD0000 (carrega a parte superior, com a parte inferior zerada)
addi t0, t0, 0x1234   # t0 = t0 + 0x1234 -> t0 = 0xABCD1234