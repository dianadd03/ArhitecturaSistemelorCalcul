.data
    x:.long 30
    y:.long 4
    addresult: .space 4
.text
.global main
main:
et_add:
    mov x, %eax
    add y, %eax
    mov %eax, addresult
et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80