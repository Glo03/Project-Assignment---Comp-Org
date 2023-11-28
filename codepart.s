.data
prompt: .asciiz "Enter a positive integer greater than or equal to 25: "
error_msg:  .asciiz "Invalid number. Please enter a valid positive number. \n"
fib_msg:    .asciiz "Fibonacci sequence: "
newline:    .asciiz "\n"

  .text
  .globl main

main:
