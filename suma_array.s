.data 
    v:.long 10, 15, 27, 39, 11, 40
    n:.long 6
    formatPrintf:.asciz "Suma: %d\n"
.text
.global main

sumArray:
    push %ebp
    mov %esp, %ebp

    xor %eax, %eax
    push %esi
    mov 8(%ebp), %esi #$v
    push %ebx
    mov 12(%ebp), %ebx #n
    xor %ecx, %ecx

sumArray_loop:
    cmp %ecx, %ebx
    jmp sumArray_exit

    mov (%esi, %ecx, 4), %edx
    add %edx, %eax
    inc %ecx
    jmp sumArray_loop

sumArray_exit:
    pop %ebx
    pop %esi
    pop %ebp
    ret

main:

    push n
    push $v
    call sumArray
    add $8, %esp

    push %eax
    push formatPrintf
    call printf
    add $8, %esp

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
