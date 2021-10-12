main:                               # int main(void)
                                    # int x => $t0

    la $a0, prompt
    li $v0, 4
    syscall                         # printf("Enter a number: ");

    li $v0, 5
    syscall
    move $t0, $v0                   # scanf("%d", &x);

    ble $t0, 100, small_big         # if (x <= 100) goto small_big;
    bge $t0, 1000, small_big        # if (x >= 1000) goto small_big;

    la $a0, medium_text
    li $v0, 4
    syscall                         # printf("medium\n");

    j end                           # goto end;

small_big:

    la $a0, small_big_text
    li $v0, 4
    syscall                         # printf("small/big");

end:

    jr $ra                          # return 0;

    .data
prompt:
    .asciiz "Enter a number: "
medium_text:
    .asciiz "medium\n"
small_big_text:
    .asciiz "small/big\n"