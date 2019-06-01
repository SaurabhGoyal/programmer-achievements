; Coded for MacOS 64 bit, will not run in any other OS.

section .text
    global _main ; need to be declared for linker

_main:
  mov rax, 0x2000004 ; write
  mov rdi, 1 ; stdout
  mov rsi, msg
  mov rdx, msg.len
  syscall
  mov rax, 0x2000001 ; exit
  mov rdi, 0
  syscall

section .data
msg:    db      "Hello, world!", 10
.len:   equ     $ - msg
