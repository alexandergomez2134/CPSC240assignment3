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
;    Name:      display.cpp                                                        		    	*
;    Purpose:   Prints the welcome message and calls on control to produce value. Then      *
;				prints out value and outgoing message.       							                          *
;                                                                                           *
;********************************************************************************************
*/
#include <stdio.h>

extern "C" void display(double arr[], long index)

void display(double arr[], long index)
{
  for (int num = 0; num < index; num++)
  {
    printf("%lf", array[i]);
    printf("\n");
  }
}

