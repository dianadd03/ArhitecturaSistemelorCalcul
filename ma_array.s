.data
    v:.float 1.0, 2.0, 3.0, 4.0
    n:.long 4
    media:.space 4
.text
.global main


main:
    lea v, %edi #$v
    xor %ecx, %ecx #index n
    mov $0, %eax
    cvtsi2ss %eax, %xmm0 #suma

loop:
    cmp n, %ecx
    je avg

    movss (%edi, %ecx, 4), %xmm1
    addss %xmm1, %xmm0
    inc %ecx
    jmp loop

avg:
    cvtsi2ss %ecx, %xmm1
    divss %xmm1, %xmm0
    movss %xmm0, media

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

