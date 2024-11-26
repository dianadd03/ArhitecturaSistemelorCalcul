.data
    a:.space 4
    b:.space 4
    c:.space 4
    formatScanf:.asciz "%d%d%d"
    formatPrintf:.asciz "Maximul celor 3 numere este: %d\n"
.text
.global main

maxim:
    push %ebp
    mov %esp, %ebp
    mov 8(%ebp), %eax
    mov 12(%ebp), %ecx
    cmp %eax, %ecx
    jg modif1  
    jmp max_cont

modif1:
    mov %ecx, %eax

max_cont:
    mov 16(%ebp), %ecx
    cmp %eax, %ecx
    jg modif2
    jmp max_exit
modif2:
    mov %ecx, %eax
max_exit:
    pop %ebp
    ret

main:
    push $c
    push $b
    push $a
    push $formatScanf
    call scanf
    add $16, %esp

    push c
    push b
    push a
    call maxim
    add $12, %esp


    push %eax
    push $formatPrintf
    call printf
    add $8, %esp
    
et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

