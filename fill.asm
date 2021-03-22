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
;    Name:      fill.asm                                                                    *
;    Purpose:   To accept a users input of numbers and save it into an array then send      *
;               the total number of elements inputted into the array back to control.       *
;                                                                                           *
;********************************************************************************************

extern printf
extern scanf
extern atolong

global fill                  ; Makes function callable from other linked files.

section .data
    prompt db "Please enter floating point numbers separated by ws. When finished press enter followed by cnt1+D.", 10, 0
    stringFormat db "%s", 0

section .bss ;unused

section .text ;unused

fill:

; Back up all registers and set stack pointer to base pointer
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

push qword -1                           ; Extra push to create even number of pushes

;-----------------------------INITIALIZE PARAMETERS-----------------------------------------
mov qword r15, rdi                      ; Address of array saved to r15.
mov qword r14, rsi                      ; Max number of elements allowed in array.
mov qword r13, 0                        ; Set counter to 0 elements in Array.


;---------------------------------START OF LOOP---------------------------------------------
begin_loop:

; Scanf function called to take user input.
mov qword rdi, prompt
push qword 0
mov qword rsi, rsp                      ; Stack pointer points to where scanf outputs.
mov qword rax, 0
call scanf

; Tests if Control + D is entered to finish inputing into array.
cdqe
cmp rax, -1
je end_of_loop                          ; If control + D is entered, jump to end_of_loop.


;---------------------------------ASCII TO LONG---------------------------------------------
; Converts string of characters (user input) into a long integer.

mov qword rax, 0
mov qword rdi, rsp
call atolong
mov qword r12, rax                      ; Saves output long integer from atolong in r12.
pop r8                                  ; Pop off stack into any scratch register.

;--------------------------------COPY INTO ARRAY--------------------------------------------
; Adds copy of long integer into array at index of counter.

mov [r15 + 8 * r13], r12                ; Copies user input into array at index of r13.
inc r13                                 ; Increments counter r13 by 1.

;---------------------------------END OF LOOP-----------------------------------------------

; After control+D is entered the loop is skipped and so is the pop in the loop
; therefore this controlD block makes up for that missed pop.
end_of_loop:
pop r8                                  ; Pop off stack into any scratch register.

;------------------------------------EXIT---------------------------------------------------
exit:

; Restore all backed up registers to their original state.
pop rax                                 ; Remove extra push of -1 from stack.
mov qword rax, r13                      ; Copies # of elements in r13 to rax.
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
