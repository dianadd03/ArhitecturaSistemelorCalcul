.data
    n:.space 4
    textp:.asciz "Prim\n"
    textnp:.asciz "Neprim\n"
    format:.asciz "%d"
.text
.global main

main:
    push $n
    push $format
    call scanf
    add $8, %esp

    mov $1, %ebx
    cmp %ebx, n
    jle et_neprim
    mov $0, %edx
    mov n, %eax
    mov $2, %ebx
    div %ebx
    mov $0, %ebx
    cmp %edx, %ebx
    je et_neprim
    mov $3, %ecx
et_loop:
    cmp %ecx, n
    jle et_prim

    mov $0, %edx
    mov n, %eax
    div %ecx
    mov $0, %ebx
    cmp %edx, %ebx
    je et_neprim

    add $2, %ecx
    jmp et_loop

et_prim:
    push $textp
    call printf
    add $4, %esp
    jmp et_exit
et_neprim:
    push $textnp
    call printf
    add $4, %esp
et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
