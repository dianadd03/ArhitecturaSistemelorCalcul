#parcurgerea sirurilor de caractere

.data
    str:.asciz "ana are mere!\n"
.text
.global main
main:
    mov $str, %esi
    mov $0, %ecx
    mov $0, %edx

et_loop:
    movb (%esi, %ecx, 1), %al
    cmp $0, %al
    je et_exit

    cmp $' ', %al
    je is_space

    inc %ecx
    jmp et_loop

is_space:
    inc %edx
    inc %ecx
    jmp et_loop

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

# i=0
#while(i!=0)
#inca sunt in structura
#altfel exit