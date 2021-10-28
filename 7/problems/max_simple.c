int max(int a[], int length) {
    int first_element = *a;

    if (length != 1) goto max_first_if_else;
        return first_element;

    max_first_if_else:
        // find max value in rest of array
        int *a2 = a + 4;
        int max_so_far = max(a2, length - 1);
        if (first_element <= max_so_far) goto max_second_if_end;
            max_so_far = first_element;
        max_second_if_end:
        return max_so_far;
    
}

int main(void) {
    int nums[] = {1, 4, 3, 5, 2};
    int a = max(nums, 5);

    printf("%d", a);
    printf("%c", '\n');
    return 0;
}