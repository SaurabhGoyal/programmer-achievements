; Coded for MacOS 64 bit, will not run in any other OS.
; Original solution taken from - https://gist.github.com/mholmerp/6c52a675f65947235090d65f70826f88

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

%macro check_divisibility_and_print 3
    xor rdx, rdx
    mov rax, r15
    mov rcx, %1
    div rcx
    cmp rdx, 0
    mov rcx, %2
    mov rdx, %3
	jz print_text
%endmacro


%macro write_number 1

number:
    mov rax, %1
    mov rcx, 10
    xor r14, r14

loop1:
    xor rdx, rdx
    div rcx
    add rdx, '0'
    push rdx
    inc r14
    test rax, rax
    je loop2
    jmp loop1

loop2:
    pop rax
    mov [rel numberstr], rax
    mov rcx, [rel numberstr]
    write_string numberstr, 1
    dec r14
    test r14, r14
    je cont
    jmp loop2

%endmacro


section	.text
    global  _main

_main:                          	 	; entry point
	xor r15, r15                        ; r15 will hold the current number all the time.
	inc r15                             ; Start with 1.

check_div_by_15:                        ; Check for divisibility by 15.
    check_divisibility_and_print 15, str15, str15len

check_div_by_3:                         ; Check for divisibility by 3.
	check_divisibility_and_print 3, str3, str3len

check_div_by_5:                         ; Check for divisibility by 5.
	check_divisibility_and_print 5, str5, str5len

check_rest:                             ; Print number if not divisible by any of above.
    write_number r15
	jmp cont

print_text:
	write_string rcx, rdx
	jmp cont

cont:                                   ; After each number, print newline and go to next num if needed.
    write_string newline, 1
    cmp r15, maxnum
    jz end
    inc r15
    jmp check_div_by_15

end:
    exit

section .data
maxnum equ 31

str3 dw "Fizz"
str3len equ $ - str3

str5 dw "Buzz"
str5len equ $ - str5

str15 dw "Fizz-Buzz"
str15len equ $ - str15

newline db 10
numberstr   db  "000000000000000" ; just need enough space
