#parcurgerea sirurilor de caractere

.data
    str:.asciz "Hello, world!\n"
.text
.global main
main:
    mov $str, %esi
    mov $0, %ecx

et_loop:
    movb (%esi, %ecx, 1), %al
    cmp $0, %al
    je et_exit

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