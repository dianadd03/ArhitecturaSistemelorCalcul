.data
    v:.float 0.1, 0.2, 0.3, 0.15, 0.54, 0.27 
    n:.long 6
    logResult:.space 4
    entropia:.space 4
.text
.global main
main:
    lea v, %edi #$v
    xor %ecx, %ecx #index n
    mov $0, %eax
    cvtsi2ss %eax, %xmm0 #suma

loop:
    cmp n, %ecx
    je sol

    movss (%edi, %ecx, 4), %xmm1
    push %ecx
    push (%edi, %ecx, 4)
    call logf
    fstps logResult
 
    mulss logResult, %xmm1
    subss %xmm1, %xmm0

    add $4, %esp
    pop %ecx

    inc %ecx
    jmp loop

sol:
    movss %xmm0, entropia
    

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80