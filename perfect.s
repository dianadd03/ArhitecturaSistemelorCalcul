.data
    n:.space 4
    x:.space 4
    sol:.space 4
    format:.asciz "%d\n"
.text
.global main

perfect:
    push %ebp
    mov %esp, %ebp

    push %ebx
    push %esi
    mov 8(%ebp), %esi
    mov $1, %ecx
    xor %ebx, %ebx

citire:
    cmp %ecx, %esi
    je perfect_exit

    mov $0, %edx
    mov 8(%ebp), %eax
    div %ecx
    cmpl $0, %edx
    je add_sum
cont:
    inc %ecx
    jmp citire

add_sum:
    add %ecx, %ebx
    jmp cont

perfect_exit:
    mov 8(%ebp), %esi
    cmp %ebx, %esi
    je da
    mov $0, %eax
    jmp perfect_ret

da:
    mov $1, %eax
perfect_ret:
    pop %esi
    pop %ebx
    pop %ebp
    ret

main:

    push $n
    push $format
    call scanf
    add $8, %esp

    xor %ecx, %ecx
et_loop:
    cmp %ecx, n
    je afisare
    
    push %ecx

    push $x
    push $format
    call scanf
    add $8, %esp

    push x
    call perfect
    add $4, %esp

    add %eax, sol
    pop %ecx
    inc %ecx
    jmp et_loop

afisare:
    push sol
    push $format
    call printf
    add $8, %esp
et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
