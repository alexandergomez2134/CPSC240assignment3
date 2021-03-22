
;********************************************************************************************
; Program name:          Sum of an Array                                                    *
; Programming Language:  x86 Assembly                                                       *
; Program Description:   This program asks a user to input numbers into an array and        *
;                        returns the sum of numbers in the array.                           *
;                                                                                           *
;********************************************************************************************
; Author Information:                                                                       *
; Name:         Alexander Gomez                                                             *
; Email:        agomez2134@csu.fullerton.edu                                                *
; Institution:  California State University - Fullerton                                     *
; Course:       CPSC 240-07 Assembly Language                                               *
;                                                                                           *
;********************************************************************************************
; Copyright (C) 2021 Alexander Gomez                                                        *
; This program is free software: you can redistribute it and/or modify it under the terms   *
; of the GNU General Public License version 3 as published by the Free Software Foundation. *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY  *
; without even the implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. *
; See the GNU General Public License for more details. A copy of the GNU General Public     *
; License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;                                                                                           *
;********************************************************************************************
; Program information                                                                       *
;   Program name: Sum of an Array                                                           *
;   Programming languages: One module in C, Three modules in X86, One module in c++         *
;   Files in this program: control.asm, fill.asm, sum.asm, main.c,                          *
;   					             display.cpp                                                      *
;                                                                                           *
;********************************************************************************************
; This File                                                                                 *
;    Name:      control.asm                                                                 *
;    Purpose:   To manage all the files in the program and call to functions fill,          *
;               sum and display as needed.                                                  *
;                                                                                           *
;********************************************************************************************

extern printf
extern scanf
extern fill
extern control
extern sum
extern display

array_size equ 100                  ; Capacity limit for number of elements allowed in array.

global manager                      ; Makes function callable from other linked files.

section .data
    intructions db "Welcome to HSAS. The accuracy and reliability of this program is guaranteed by Alexander Gomez", 10,
    numsreceived db 10, "These numbers you entered are these ", 10, 0
    stringNumFormat db "The sum of these values is %ld.", 10, 0
    sumprompt db 10, "The control module will now return the sum to the caller module.", 10, 0
    stringFormat db "%s", 0

section .bss
    array: resq 100                  ; Uninitialized array with 100 reserved qwords.

section .text

cont:

; Backs up registers
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf

push qword -1

;-----------------------------INITIALIZE PARAMETERS-----------------------------------------

mov qword r14, 0                        ; Reserve register for number of elements in array.
mov qword r13, 0                        ; Reserve register for Sum of numbers in array

;-------------------------------INSTRUCTION PROMPT------------------------------------------

mov qword rdi, stringFormat
mov qword rsi, intructions
mov qword rax, 0
call printf                             ; Prints out instruction prompt.

;---------------------------CALL FUNCTION INPUT_ARRAY---------------------------------------

mov qword rdi, array                    ; Passes array into rdi register.
mov qword rsi, array_size               ; Passes the max array size into rsi register.
mov qword rax, 0
call fill                               ; Calls funtion fill.
mov r14, rax                            ; Saves copy of fill output into r14.

;-------------------------CONFIRMS OUTPUT OF INPUTTED VALUES--------------------------------

mov qword rdi, stringFormat
mov qword rsi, numsreceived
mov qword rax, 0
call printf                             ; Prints out received confirmation

;----------------------------DISPLAY ELEMENTS OF ARRAY--------------------------------------

mov qword rdi, array                    ; Passes the array as first parameter.
mov qword rsi, r14                      ; Passes # of elements in the array stored in r14.
mov qword rax, 0
call display                            ; Calls display_array function.

;-----------------------------------SUM-----------------------------------------------
; Calls function sum to return the sum of numbers in the array

mov qword rdi, array                    ; Passes the array as first parameter.
mov qword rsi, r14                      ; Passes # of elements in the array stored in r14.
mov qword rax, 0
call sum                                ; Function sum to add all the elements in array.
mov r13, rax                            ; Saves a copy of the sum functions output to r13.

;--------------------------PRINTS OUT TOTAL # OF values AND SUM---------------------------

mov qword rdi, stringNumFormat
mov qword rsi, r14                      ; Passes number of elements in the array to print.
mov qword rdx, r13                      ; Passes the sum of integers in the array to print.
mov qword rax, 0
call printf                             ; Prints out # of elements & sum

;---------------------------------PRINTS OUT SUMPROMPT--------------------------------------

mov qword rdi, stringFormat
mov qword rsi, sumprompt
mov qword rax, 0
call printf                             ; Prints out that sum will be returned to main.

;---------------------------------END OF FILE-----------------------------------------------

; Restores all registers to their original state.
pop rax
mov qword rax, r13
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret
