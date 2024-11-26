.data
    n:.space 4
    x:.space 4
    v:.space 400
    formatscanf:.asciz "%d"
    formatPrintf:.asciz "Rezultatul este : %d\n"
.text
.global main
main:
citire:
    push $n
    push $formatscanf
    call scanf
    pop %ebx
    pop %ebx


    mov $v, %edi
    mov $0, %ecx
et_loop:
    cmp n, %ecx
    je produs
    push %ecx
    push $x
    push $formatscanf
    call scanf
    pop %ebx
    pop %ebx
    pop %ecx
    movl x, %ebx
    movl %ebx, (%edi, %ecx, 4)
    inc %ecx
    jmp et_loop

produs:
    mov $0, %ecx
    mov $0, %edx
    mov $1, %eax
et_loopp:
    cmp n, %ecx
    je afisare
    movl (%edi, %ecx, 4), %ebx
    mull %ebx
    inc %ecx
    jmp et_loopp

afisare:
    push %eax
    push $formatPrintf
    call printf
    pop %ebx
    pop %ebx
et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
