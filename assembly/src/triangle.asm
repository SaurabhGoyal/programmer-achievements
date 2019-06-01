section .text
    global _main

_main:
    mov rdx, buffer    ; Buffer output
    mov r8, 1          ; Line number
    mov r9, 0          ; Char count on current line
line:
    mov byte [rdx], '*'         ; write char
    inc rdx                     ; increment rdx pointer
    inc r9                      ; increment char count on line
    cmp r9, r8                  ; compare current count and expected count
    jne line                    ; go back to line printing if more chars are to be printed
lineDone:
    mov byte [rdx], 10          ; 10 is new line character
    inc rdx                     ; increment rdx pointer
    inc r8                      ; Increase line number
    mov r9, 0                   ; Reset char count on current line
    cmp r8, maxlines            ; compare current line number and expected line count
    jng line                   ; Print another line if line number <= expected line count
done:
    mov rax, 0x02000004     ; Sys call for write operation
    mov rdi, 1              ; File handle for stdout is 1
    mov rsi, buffer         ; Have output ready for print
    mov rdx, buffersize     ; ???
    syscall                 ; Perform write
    mov rax, 0x02000001     ; Sys call for exit
    xor rdi, rdi            ; Exit status code should be 0
    syscall                 ; Perform exit

section .bss
maxlines equ 20
buffersize equ 44
buffer: resb buffersize

