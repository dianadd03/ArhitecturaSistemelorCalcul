.data
    a:.space 4
    b:.space 4
    formatScanf:.asciz "%d%d"
    formatPrintf:.asciz "Minimul celor 2 numere este: %d\n"
.text
.global main

minim:
    push %ebp
    mov %esp, %ebp
    mov 8(%ebp), %eax
    mov 12(%ebp), %ecx
    cmp %eax, %ecx
    jl modif  
    jmp min_exit

modif:
    mov %ecx, %eax

min_exit:
    pop %ebp
    ret

main:
    push $b
    push $a
    push $formatScanf
    call scanf
    pop %ebx
    pop %ebx
    pop %ebx

    push b
    push a
    call minim
    add $8, %esp


    push %eax
    push $formatPrintf
    call printf
    add $8, %esp
    
et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

