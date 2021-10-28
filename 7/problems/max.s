max:                                    # int max(int a[], int length) {
                                        # $a0 => a, $a1 => length
    addi $sp, -8
    sw $ra, 4($sp)
    sw $s0, 0($sp)                      # first_element 
    
    lw $s0, ($a0)                       # int first_element = *a;

    bne $a1, 1, max_first_if_else       # if (length != 1) goto max_first_if_else;
    
    lw $ra, 4($sp)
    lw $s0, 0($sp)
    addi $sp, 8

    jr $ra                              # return first_element;

max_first_if_else:
                                        # find max value in rest of array
                                        # $a0 => a2                
    addi $a0, $a0, 4                    # int *a2 = a + 4;
    addi $a1, $a1, -1

    jal max                             # int max_so_far = max(a2, length - 1);
    
    ble $s0, $v0, max_second_if_end     # if (first_element <= max_so_far) goto max_second_if_end;
    
    move $v0, $s0                       # max_so_far = first_element;
max_second_if_end:
    
    lw $ra, 4($sp)
    lw $s0, 0($sp) 
    addi $sp, 8

    jr $ra                              # return max_so_far;


main:                                   # int main(void) {

    addi $sp, -4
    sw $ra, 0($sp)

    la $a0, nums
    li $a1, 5
    jal max                             # int a = max(nums, 5);

    move $a0, $v0
    li $v0, 1
    syscall                             # printf("%d", a);

    li $a0, 10
    li $v0, 11
    syscall                             # printf("%c", '\n');

    lw $ra, 0($sp)
    addi $sp, 4

    jr $ra                              # return 0;

.data
nums: .word 9999999 4 3 1010010 2