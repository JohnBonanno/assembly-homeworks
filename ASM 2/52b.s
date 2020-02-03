.section .text
.global log2
log2: 
#rbx and rbp need preserved

movq $1, %rdi #this is strictly for comparison and division by 2

cmpq %rax, %rdi #checks is rax <= 1, if so 
jle isZero #jmp to return 0

loop:
pushq %rbp #preserve og value rbp push to stack
movq %rsp, %rbp #preserve og value rsp in rbp (dont touch this)
shrq %rax #divides rax by 2

cmpq %rax, %rdi #if not equal to one jmp to log so rax value placed to top of stack
jg loop 


#call:
#call loop 

isZero: 
movq $0, %rax

movq %rsp, %rax # save ret value

movq %rbp, %rsp # restore og rsp from rbp

popq %rbp # restores old rbp from top of stack 

addq $1, %rax

ret
