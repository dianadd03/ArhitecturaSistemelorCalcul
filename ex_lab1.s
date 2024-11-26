.data
    x:.long 5
    y:.long 7
    s:.space 12
.text
.global main

main:

et_swap:
    mov x, %eax
    mov y, %ebx
    mov %eax, y
    mov %ebx, x

et_citire:
    mov $3, %eax
    mov $0, %ebx
    mov $s, %ecx
    mov $12, %edx
    int $0x80

et_afisare:
    mov $4, %eax
    mov $1, %ebx
    mov $s, %ecx
    mov $12, %edx
    int $0x80

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
