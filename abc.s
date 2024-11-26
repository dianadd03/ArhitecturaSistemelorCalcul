.data
    p:.long 
    n:.long 256
.text
.global main
main:
    movl $1, p
    movl $1, %esi

et_loop:
    cmp n, %esi
    je et_exit

    movl $2, %eax
    mull p
    movl %eax, p

    movl $2, %ebx
    movl n, %eax
    movl $0, %edx
    div %ebx

    addl %edx, p
    movl %eax, n

    jmp et_loop

res:
    movl p, %eax

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80