.data
    str1: .asciz "Str 1\n"
    str2: .asciz "Str 2\n"
.text
 
.global main
 
main:
 
    jmp show_str2 
 
show_str1:
    mov $4, %eax        # codul apelului de sistem WRITE 
    mov $1, %ebx        # scriere la STDOUT 
    mov $str1, %ecx     # $ - adresa sirului de caractere. punem in %ecx ce vrem sa scriem 
    mov $7, %edx        # lungimea sirului de afisat 
    int $0x80           # intreruperea hardware cu codul pentru apelul de sistem 
 
    jmp et_exit 
 
show_str2: 
    mov $4, %eax 
    mov $1, %ebx 
    mov $str2, %ecx 
    mov $7, %edx 
    int $0x80 
 
    jmp show_str1 
 
et_exit:
    mov $1, %eax 
    mov $0, %ebx
    int $0x80
    