# Sa se scrie un program care sa afiseze la STDOUT unul dintre sirurile 
# "x >= y", respectiv "x < y", dupa caz 
# x si y se considera declarate si initializate in sectiunea .data 
 
.data 
    x: .long 20 
    y: .long 18 
    x_ge_y: .asciz "x >= y\n"
    x_l_y: .asciz "x < y\n"
.text 
 
.global main 
 
main:
    mov x, %eax 
    cmp y, %eax         # se compara %eax(=x) cu y 
    jl show_x_l_y       # daca x < y sari la show_x_l_y 
 
show_x_ge_y:
    mov $4, %eax
    mov $1, %ebx 
    mov $x_ge_y, %ecx 
    mov $8, %edx 
    int $0x80 
 
    jmp et_exit 
 
show_x_l_y:
    mov $4, %eax 
    mov $1, %ebx 
    mov $x_l_y, %ecx 
    mov $7, %edx 
    int $0x80 
 
et_exit:
    mov $1, %eax 
    mov $0, %ebx

        int $0x80 
