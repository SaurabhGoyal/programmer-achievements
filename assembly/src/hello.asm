; Coded for MacOS 64 bit, will not run in any other OS.

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

section .text
    global _main ; need to be declared for linker

_main:
    write_string msg, msg.len
    exit

section .data
msg:    db      "Hello, world!", 10
.len:   equ     $ - msg
