section .text
    global _main

%macro write_string 2
    mov rax, 0x02000004     ; Sys call for write operation
    mov rdi, 1              ; File handle for stdout is 1
    mov rsi, %1             ; String to print
    mov rdx, %2             ; Length of string to print
    syscall                 ; Perform write
%endmacro

%macro exit 0
    mov rax, 0x2000001 ; exit
    mov rdi, 0
    syscall
%endmacro

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
    write_string buffer, buffersize      ; Print output
    exit

section .bss
maxlines equ 8
buffersize equ (maxlines * (maxlines + 3)) / 2        ; Number of stars for n lines + number of new line chars for each line.
buffer: resb buffersize
