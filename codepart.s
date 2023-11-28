.data
prompt: .asciiz "Enter a positive integer greater than or equal to 25: "
error_msg:  .asciiz "Invalid number. Please enter a valid positive number. \n"
fib_msg:    .asciiz "Fibonacci sequence: "
newline:    .asciiz "\n"

  .text
  .globl main

main:
  li $v0, 4       #system call (syscall) for print_str
  la $a0, prompt  #load the address of prompt
  syscall
  
  #read user input
  li $v0, 5   #syscall (System call): read_int
  syscall
  move $t0, $v0   #save user input in $t0

  #Verify if the entered number is valid
