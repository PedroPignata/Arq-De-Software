/*
Código em Assembly equivalente: função main que soma os números de 4 a 1
    .text
    .globl main
main:
addi t0, x0, 4
addi t1, x0, 0

loop:
    addi t1, t1, t0
    addi t0, t0, -1
    bnez t0, loop
    addi a0, t1, 0
    ret

*/

#include <stdio.h>

int main(){
    int t0 = 4;
    int t1 = 0;
    int a0;
    
    while (t0 != 0){
        t1 = t1 + t0;
        t0 = t0 -1;
    }

    a0 = t1;

    return a0; 

    //  printf("Resultado (a0): %d\n", a0);  
    //  return 0; 
}


/*
Jeito do Professor:
# include <stdio.h>
int g() {

    int t0 = 4;
    int t1 = 0;

    while(t0 != 0) {
        t1 += t0;
        t0--;
    }   
    return t1;

}
*/