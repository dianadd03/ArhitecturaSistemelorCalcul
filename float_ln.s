.data
    n:.float 2.7182818284
    logResult:.space 4
.text
.global main
main:
    flds n
    sub $4, %esp
    fstps 0(%esp)
    call logf
    fstps logResult
    add $4, %esp
et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80