#suma dintr-un array
.data
v:.long 3, 5, 27, 8, 11
n:.long 5
.text

.global main

main:
    mov $0, %eax #suma
    mov $0, %ecx #pe post de i
    mov $v, %esi #incarcam adresa lui v

et_for:
    cmp n, %ecx
    je et_exit

    movl (%esi, %ecx, 4), %ebx
    add %ebx, %eax
    inc %ecx
    jmp et_for


et_exit:
    mov $1, %eax
    xor %ebx, %ebx #mov $0, %ebx
    int $0x80

