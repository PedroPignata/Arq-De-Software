/*
Código em Risc-V
.text
.globl f

f:

loop:
lw t0, 0(a0)
beq t0, x0, end
add a1, a1, t0
addi a0, a0, 4
jal x0, loop

end:
addi a0, a1, 0
jalr x0, 0(ra)
*/

#include <stdio.h>

    int main( int *a0, int soma){
        int sum = soma;   // a1 é a soma        
        int value;        // t0 é o valor lido

        while ('1')
        {
            // lw t0, 0(a0)
            value = *a0;
            // beq t0, x0, end
        if (value == 0) { 
            break;
        }
            // add a1, a1, t0
            sum = sum + value; 

            // addi a0, a0, 4
            a0++;
        
            // jal x0, loop (volta para o início do while)
    }

    // end: addi a0, a1, 0
    return sum;
}