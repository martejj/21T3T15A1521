#include <stdio.h>

# int sum4(int a, int b, int c, int d);
# int sum2(int x, int y);

main:                               # int main(void) {

    addi $sp, -4
    sw $ra, 0($sp)

    li $a0, 11
    li $a1, 13
    li $a2, 17
    li $a3, 19

    jal sum4                        # int z = sum4(11, 13, 17, 19);
    
    move $a0, $v0                   # printf("%d", z);
    li $v0, 1
    syscall

    li $v0, 11
    li $a0, 10
    syscall                         # printf("%c", '\n');
    
    lw $ra, 0($sp)
    addi $sp, 4

    li $v0, 0
    jr $ra                          # return 0;


sum4:                               # int sum4(int a, int b, int c, int d) {
                                    # a0, a1, a2, a3
    addi $sp, -16
    sw $s0, 12($sp)
    sw $ra, 8($sp)
    sw $a2, 4($sp)                  # c
    sw $a3, 0($sp)                  # d

    jal sum2                        #int e = sum2(a, b);
                                    # $v0 contains sum2(a, b)
    move $s0, $v0

    lw $a0, 4($sp)                  # $a0 = c
    lw $a1, 0($sp)                  # $a1 = d

    jal sum2                        # int f = sum2(c, d);

    move $a0, $v0                   # $a0 = f
    move $a1, $s0                   # $a1 = e
    
    jal sum2                        # sum2(e, f);

    lw $ra, 8($sp)
    lw $s0, 12($sp)
    addi $sp, 16

    jr $ra

# Takes in x as $a0, y as $a1 and returns x + y
sum2:                               # int sum2(int x, int y) {
    li $a2, 0
    li $a3, 0
    add $v0, $a0, $a1       
    jr $ra                          # return x + y;
