#include <stdio.h>
#include <string.h>
#include <stddef.h>

// 1. PROTÓTIPOS DAS FUNÇÕES, extern diz ao compilador que o código está em outro lugar.
extern size_t strlen(const char *s); 
extern char *strcpy(char *dest, const char *src);
extern int strcmp(const char *s1, const char *s2);
extern char *strcat(char *dest, const char *src);
extern int strncmp(const char *s1, const char *s2, size_t n);

#define BUFFER_SIZE 100

int main (){
    printf(" Testes Mini Biblioteca Strin Risc-V\n");

        // 1. TESTE: strlen(const char *s)

    printf(" Teste strlen\n");
    const char *s_len = "Trabalho-AOC-01";
    int lenresult = strlen(s_len);
    printf(" String: \"%s\"\n", s_len);
    printf(" Resultado: %d\n\n", lenresult);

    // 2. TESTE: strcpy(char *dest, const char *src)

    printf(" Teste strcpy\n");
    char dest_cpy[BUFFER_SIZE];
    const char *src_cpy = "Risc-V Assembly";

    strcpy(dest_cpy, src_cpy);

    printf(" String Copiada(dest): \"%s\"\n", dest_cpy);
    printf(" Tamanho da Cópia: %zu (Esperado: 15)\n\n", strlen(dest_cpy)); 

    // 3. TESTE: strcmp(const char *s1, const char *s2)

    printf(" Teste strcmp:\n");
    // Declarando ponteiros de leitura que apontam para strings inicializando-o com o endereço de memoria.
    const char *s1_cmp = "laranja";
    const char *s2_cmp_igual = "laranja";
    const char *s2_cmp_maior = "morango";
    const char *s2_cmp_menor = "lagarta";
    
    // Cs 1: Iguais (Retorna 0)
    printf("   Comparando \"%s\" e \"%s\": %d (Esperado: 0)\n", s1_cmp, s2_cmp_igual, strcmp(s1_cmp, s2_cmp_igual));
    
    // Cs 2: s1 < s2 (Retorna Negativo)
    int res_menor = strcmp(s1_cmp, s2_cmp_maior);
    printf("   Comparando \"%s\" e \"%s\": %d (Esperado: < 0)\n", s1_cmp, s2_cmp_maior, res_menor);

    // Cs 3: s1 > s2 (Retorna Positivo - 'p' > 'r')
    int res_maior = strcmp(s1_cmp, s2_cmp_menor);
    printf("   Comparando \"%s\" e \"%s\": %d (Esperado: > 0)\n\n", s1_cmp, s2_cmp_menor, res_maior);

    // 4. TESTE: strcat(char *dest, const char *src)

    printf(" Teste strcat:\n");
    char dest_cat[BUFFER_SIZE] = "Hello"; // dest precisa ser inicializado e ter espaço!
    const char *src_cat = " World!";
    
    strcat(dest_cat, src_cat);
    
    printf(" String Concatenada (dest): \"%s\"\n", dest_cat);
    printf(" Tamanho da Concatenação: %zu \n\n", strlen(dest_cat));

    //5. TESTE: strncmp(const char *s1, const char *s2, size_t n)

    printf(" Teste strncmp:\n");
    const char *s1_ncmp = "abcd-efg";
    const char *s2_ncmp = "abxt-zij";
    
    // Cs 1: Iguais nos primeiros 2 (Retorna 0)
    int ncmp_res1 = strncmp(s1_ncmp, s2_ncmp, 2);
    printf("   Comparando \"%s\" e \"%s\" (n=2): %d (Esperado: 0)\n", s1_ncmp, s2_ncmp, ncmp_res1);
    
    // Cs 2: Diferentes no terceiro (Retorna Negativo: 'c' < 'x')
    int ncmp_res2 = strncmp(s1_ncmp, s2_ncmp, 4);
    printf("   Comparando \"%s\" e \"%s\" (n=4): %d (Esperado: < 0)\n\n", s1_ncmp, s2_ncmp, ncmp_res2);


    return 0;

}