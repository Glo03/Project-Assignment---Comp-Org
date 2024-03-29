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
  bge $t0, 25, input_true #Branch if the enter a number >= 25
  li $v0, 4   #system call (syscall) for print_str
  la $a0, error_msg   #Load the address of the error message
  syscall
  j main  #jump back to the beginning of the main
input_true:
  #initial variable for Fibonacci sequence
  li $t1, 0   #first fibonacci number
  li $t2, 1   #second fibonacci number
  li $t3, 0   #counter

  fibonacci_loop:
      #print the current fibonacci number
      li $v0, 1   #syscall (System call) for print_str
      move $a0, $t1   #load current fibonacci number
      syscall

      #Calculate next fibonacci number
      add $t4, $t1, $t2   #$t4 = $t1 + $t2
      move $t1, $t2   #update $t1 to the next number in sequence
      move $t2, $t4   #moving the next Fibonacci number to the second
      addi $t3, $t3, 1  #increment the counter

      #Check if we have printed enter numbers
      bne $t3, $t0, fibonacci_loop #loop if the counter is less than enter number

      #print a newline
      li $v0, 4   #system call (syscall) for print_str
      la $a0, newline #load address of newline
      syscall
  #Exit program
  li $v0, 10  #syscall 10 for exit
  syscall

