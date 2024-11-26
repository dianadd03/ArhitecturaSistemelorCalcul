.data
    v:.space 400
    n:.space 4
    x:.space 4
    formatScanf:.asciz "%d"
    formatPrintf1:.asciz "Maximul este : %d\n"
    formatPrintf2:.asciz "Nr de aparitii este: %d\n"
.text
.global main

maxim:
    push %ebp
    mov %esp, %ebp
    push %esi
    mov 8(%ebp), %esi #$v
    push %ebx
    mov 12(%ebp), %ebx #n
    xor %ecx, %ecx
    mov (%esi, %ecx, 4), %eax
    inc %ecx

maxim_loop:
    cmp %ecx, %ebx
    je maxim_exit

    movl (%esi, %ecx, 4), %edx
    cmp %edx, %eax
    jl actualizare_max

    inc %ecx
    jmp maxim_loop

actualizare_max:
    mov %edx, %eax
    inc %ecx
    jmp maxim_loop

maxim_exit:
    pop %ebx
    pop %esi
    pop %ebp
    ret

maxAparitii:
    push %ebp
    mov %esp, %ebp
    push %esi
    movl 8(%ebp), %esi #$v
    push %ebx
    movl 12(%ebp), %ebx #n
    push %edi

    push n
    push $v
    call maxim
    add $8, %esp

    xor %ecx, %ecx
    xor %edx, %edx

maxAparitii_loop:
    cmp %ecx, %ebx
    je maxAparitii_exit

    movl (%esi, %ecx, 4), %edi
    cmp %edi, %eax
    je actualizare_nrap

    inc %ecx
    jmp maxAparitii_loop

actualizare_nrap:
    add $1, %edx
    inc %ecx
    jmp maxAparitii_loop

maxAparitii_exit:
    pop %edi
    pop %ebx
    pop %esi
    pop %ebp
    ret



main:

    push $n 
    push $formatScanf
    call scanf 
    add $8, %esp
 
    mov $v, %esi
    xor %ecx, %ecx
    mov %esi, %ebx
 
citire_array:
    cmp n, %ecx
    je while_exit
 
    push %ecx
    push %ebx
    push $formatScanf
    call scanf
    add $8, %esp
    pop %ecx
 
    addl $4, %ebx
    inc %ecx
    jmp citire_array

while_exit:
    push n
    push $v
    call maxAparitii
    add $8, %esp
 

afisare:
    push %edx
    push %eax
    push $formatPrintf1
    call printf
    add $8, %esp
    push $formatPrintf2
    call printf
    add $8, %esp

exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80