#include <stdio.h>

// Função que calcula o N-ésimo número da sequência de Fibonacci.
int fibonacci(int n) {
    
    // --- CASO BASE 1: F(0) = 0 ---
    if (n == 0) {
        return 0;   
    }
    
    // --- CASO BASE 2: F(1) = 1 ---
    if (n == 1) {
        return 1;
    }
    
    // --- PASSO RECURSIVO: F(n) = F(n-1) + F(n-2) ---
    // A soma de DUAS chamadas recursivas é o que torna este desafio 
    // significativamente mais complexo que o Fatorial.
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    int N = 6; // Vamos calcular F(6)
    // F(6) = F(5) + F(4) = 8
    
    int resultado = fibonacci(N);

    printf("Fibonacci de %d é: %d\n", N, resultado);
    
    return 0;
}