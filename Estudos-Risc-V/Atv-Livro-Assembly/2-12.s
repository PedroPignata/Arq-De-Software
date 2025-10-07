# O montador (assembler) do RISC-V fornece a pseudoinstrução 'mv'.
# mv t0, t1            # Copia o valor de t1 para t0.

# O montador traduz isso para uma instrução real que o hardware entende:
# addi t0, t1, 0       # t0 = t1 + 0.