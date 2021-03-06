section .data
        digit db 0, 10                  ; define the digit as 0 and newline

section .text
        global _start
        
_start:
        mov rax, 7                      ; set the digit to print as '7'
        call _printDigit                ; call subroutine '_printDigit'
        
        ; perform sys_exit
        mov rax, 60
        mov rdi, 0
        syscall

; prints the digit of rax
_printDigit:
        add rax, 48                     ; 48 is the value of the character '0' in ASCII, '1' is 49...
        mov [digit], al                 ; move lower byte of rax register to 'digit'
        
        ; perform sys_write
        mov rax, 1
        mov rdi, 1
        mov rsi, digit
        mov rdx, 2
        syscall
