.data
prompt: .asciiz "Please enter a positive integer >= 25"
error_msg: .asciiz "Invalid input/Illegal number. Please enter a valid number.\n"
fib_msg: .asciiz "The Fibonacci sequence: \n"
new_line: .asciiz "\n"

.text
main:
#Prompt user for input
li $v0, 4  #System call for print_str
