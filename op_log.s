.data
    x:.long 10
    y:.long 7
.text
.global main
main:
    mov x, %eax
    mov y, %ebx
et_and:
    and %eax, %ebx
et_test:
    mov y, %eax
    test %eax, %ebx
et_or:
    mov y, %ebx
    or %eax, %ebx
et_xor:
    mov y, %ebx
    xor %eax, %ebx
et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80

