.section .text
.globl _start
_start:


#movl $5, %eax
#movl $10, %ebx
#movl $3, %ecx

addl %eax, %ebx
subl %ecx, %ebx
#movl %ebx, %edi

end:

movl $1, %eax
int $0x80
