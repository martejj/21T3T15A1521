main:                                   # int main(void) 
                                        # i => $t0
    li $t0, 0                           # int i = 0;

main_do_start:
    addi $t0, $t0, 1                    # i++;

    li $v0, 1
    move $a0, $t0
    syscall                             # printf("%d", i);
    
    li $v0, 11
    li $a0, 10
    syscall                             # printf("\n");

    blt $t0, 10, main_do_start          # if (i < 10) goto main_do_start;
    
    li $v0, 0
    jr $ra                              # return 0;