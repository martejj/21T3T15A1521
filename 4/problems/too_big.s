main:                           # main(void)
                                # int x, y => t0, t1

    la $a0, prompt
    li $v0, 4
    syscall                     # printf("Enter a number: ");

    li $v0, 5
    syscall
    move $t0, $v0               # scanf("%d", &x);

    blt $t0, 46340, print       # if (x < 46340) goto print;
    
    la $a0, big
    li $v0, 4
    syscall                     # printf("square too big for 32 bits\n");
    
    j end                       # goto end;

print:
    mul $t1, $t0, $t0           # y = x * x;

    li $v0, 1
    move $a0, $t1
    syscall                     # printf("%d", y);

    li $v0, 11
    li $a0, '\n'
    syscall                     # printf("%c", '\n');
end:

    jr $ra                      # return 0;

    .data
prompt:
    .asciiz "Enter a number: "
big:
    .asciiz "square too big for 32 bits\n"