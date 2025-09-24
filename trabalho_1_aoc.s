.data
str1:   .string "Ola"
str2:   .string "Mundo"
str3:   .string "Oma"
buf:    .zero 50              # buffer vazio com 50 bytes

    .text
    .globl strlen
    .globl strcpy
    .globl strcmp
    .globl strcat
    .globl strncmp
    .globl _start           

# ---------------- Funções ----------------

# strlen(a0=string) -> a0=tamanho
strlen:
    mv t0, a0           # Copia o ponteiro da string para t0
    li t1, 0            # Inicializa o contador de tamanho (t1) em 0
loop_strlen:
    lbu t2, 0(t0)       # Carrega o byte para t2
    beq t2, x0, end_strlen  # Se o byte for nulo, sai do loop
    addi t0, t0, 1      # Avança o ponteiro da string
    addi t1, t1, 1      # Incrementa o contador de tamanho
    j loop_strlen
end_strlen:
    mv a0, t1           # Move o tamanho para o registrador de retorno a0
    jr ra
    
# strcpy(dest=a0, src=a1) → retorna dest
strcpy:
    mv t2, a0
copy_loop:
    lbu t0, 0(a1)
    sb t0, 0(a0)
    beq t0, x0, copy_end
    addi a0, a0, 1
    addi a1, a1, 1
    j copy_loop
copy_end:
    mv a0, t2
    jr ra

# strcmp(s1=a0, s2=a1) → <0,0,>0
strcmp:
loop_strcmp:
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    bne t0, t1, diff
    beq t0, x0, equal
    addi a0, a0, 1
    addi a1, a1, 1
    j loop_strcmp
diff:
    sub a0, t0, t1
    jr ra
equal:
    li a0, 0
    jr ra

# strcat(dest=a0, src=a1)
strcat:
    mv t2, a0
find_end:
    lbu t0, 0(a0)
    beq t0, x0, copy_concat
    addi a0, a0, 1
    j find_end
copy_concat:
    lbu t1, 0(a1)
    sb t1, 0(a0)
    beq t1, x0, end_concat
    addi a0, a0, 1
    addi a1, a1, 1
    j copy_concat
end_concat:
    mv a0, t2
    jr ra

# strncmp(s1=a0, s2=a1, n=a2)
strncmp:
    beq a2, x0, strncmp_eq
loop_strncmp:
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    bne t0, t1, strncmp_diff
    beq t0, x0, strncmp_eq
    addi a0, a0, 1
    addi a1, a1, 1
    addi a2, a2, -1
    bnez a2, loop_strncmp
strncmp_eq:
    li a0, 0
    jr ra
strncmp_diff:
    sub a0, t0, t1
    jr ra

# ---------------- Testes (_start) ----------------

_start:

    # Teste 1: strlen("Ola") -> esperado 3
    la a0, str1
    jal strlen
    mv s0, a0           # guarda em s0
    nop

    # Teste 2: strcpy(buf, "Ola")
    la a0, buf          # Destino (buf) em a0
    la a1, str1         # Fonte (str1) em a1
    jal strcpy
    mv s1, a0           # guarda em s1 (ptr buffer)
    nop

    # Teste 3: strcmp("Ola","Mundo") -> esperado !=0
    la a0, str1
    la a1, str2
    jal strcmp
    mv s2, a0           # guarda em s2 (esperado >0)
    nop

    # Teste 4: strcat(buf,"Mundo") -> buf = "OlaMundo"
    la a0, buf          # Destino (buf) em a0
    la a1, str2         # Fonte (str2) em a1
    jal strcat
    mv s3, a0           # guarda em s3
    nop

    # Teste 5: strncmp("Ola","Oma",2) -> compara "Ol" vs "Om"
    la a0, str1
    la a1, str3
    li a2, 2
    jal strncmp
    mv s4, a0           # guarda em s4 (esperado !=0, deve ser negativo)
    nop

halt:
    j halt              # trava no fim