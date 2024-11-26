# Instructiunile aritmetice 
 
.data
    x: .long 30 
    y: .long 4 
    addResult: .space 4 
    subResult: .space 4 
    mulResult: .space 4
    divResult: .space 4 
    modResult: .space 4
.text 
 
.global main 
 
main:
 
et_add:
    mov x, %eax 
    add y, %eax     # %eax <- %eax (=x) + y = x + y 
    mov %eax, addResult 
 
et_sub:
    mov x, %eax 
    sub y, %eax     # %eax <- %eax (=x) - y = x - y 
    mov %eax, subResult 
 
et_mul:
    # mull op (pentru a permite ca op sa fie si altceva in afara de registru)
    # (%edx, %eax) <- %eax * op 
    # inseamna ca trebuie ca unul dintre operanzi sa fie deja completat in %eax 
    mov x, %eax 
    mull y 
    mov %eax, mulResult 
 
et_div:
    # x / y 
    # divl op 
    # (%edx, %eax) <- (%edx, %eax) / op 
    #  rest   cat     ext pe 64b 
    mov x, %eax 
    mov $0, %edx    # strict in acest caz, aceasta linie este reduntanta, intrucat 
                    # %edx avea deja valoarea 0 in urma inmultirii 
    divl y 
    mov %eax, divResult 
    mov %edx, modResult 
 
et_exit:
    mov $1, %eax 
    mov $0, %ebx 
    int $0x80 