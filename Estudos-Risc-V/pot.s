#   int pot(int base, int exp) {
#   if(exp == 0) return 1;
#   return base * pot(base, exp - 1);
#   }

.text
.data
.globl main

# a0 = base
# a1 = exp
# exp = 0?

main:
    addi a0, x0, 2      # base = 2
    addi a1, x0, 5      # exp = 5

pot:
   addi sp, sp, -8 
   sw ra, 4(sp)
   sw a0, 0(sp)

   beq a1, zero, r1

   addi a1, a1, -1
   jal ra, pot

   lw t0, 0(sp)
   mul a0, a0, t0
   jal x0, return

r1:
    li a0, 1

return:
    lw ra, 4(sp)
    addi sp, sp, 8
    jalr x0, 0(ra)

