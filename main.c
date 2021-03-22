/*
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
;    Name:      main.c                                                            		    	*
;    Purpose:   Prints the welcome message and calls on control to produce value. Then      *
;				prints out value and outgoing message.       							                          *
;                                                                                           *
;********************************************************************************************
*/

#include <stdio.h>
#include <stdint.h>

long int control();

int main()
{long int result_code = -999;
	printf("%s","\nWelcome to High Speed Array Summation by Alexander Gomez\n");
	printf("%s","Software Licensed by GNU GPL 3.0\n\n");
  	printf("%s","Version 1.0 released on January 28,2021\n\n");
	result_code = control();
	printf("%s%ld%s","\nThe main has received this number, ",result_code, " and will keep it.\n");
	printf("%s","Thank you for using High Speed Array Software.\n\n");
  printf("%s","For system support contact Alexander Gomez at agomez2134@csu.fullerton.edu.\n\n");
  printf("%s","A zero will be returned to the operating system.\n\n");
	return 0;
}
