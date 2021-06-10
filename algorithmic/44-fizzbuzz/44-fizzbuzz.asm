;; This program is in NASM
;; Compile with: nasm -f elf 44-fizzbuzz.asm
;; Link with: ld -m elf_i386 44-fizzbuzz.o -o fizzbuzz
;; Run with: ./fizzbuzz

;; The functions file, as well as most of the code is stolen from
;; asmtutor.com because I'm currently just learning assembly and
;; I'm not smart enough to write in it myself

%include    "functions.asm"

SECTION .data
fizz    db      "Fizz", 0h
buzz    db      "Buzz", 0h

SECTION .text
global _start

_start:
    mov     esi, 0
    mov     edi, 0
    mov     ecx, 0

iterate:
    inc     ecx

    .isFizz:
    mov     edx, 0
    mov     eax, ecx
    mov     ebx, 3
    div     ebx
    mov     edi, edx
    cmp     edi, 0
    jne     .isBuzz
    mov     eax, fizz
    call    sprint

    .isBuzz:
    mov     edx, 0
    mov     eax, ecx
    mov     ebx, 5
    div     ebx
    mov     esi, edx
    cmp     esi, 0
    jne     .else
    mov     eax, buzz
    call    sprint

    .else:
    cmp     edi, 0
    je      .next
    cmp     esi, 0
    je      .next
    mov     eax, ecx
    call    iprint

    .next:
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    cmp     ecx, 100
    jne     iterate

    call    quit
