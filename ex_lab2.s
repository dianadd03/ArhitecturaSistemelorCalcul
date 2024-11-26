.data
    x:.long 5
    y:.long 32
    n:.long 16
.text
.global main
main:
et_calcul_biti:
    
et_calcul_op:
    mov $0, %edx
    mov x, %eax
    mull n
    mov %eax, %ebx
    mov y, %eax
    divl n
    add %ebx, %eax

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80