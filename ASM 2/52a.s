.section .text
.globl main
main:

#according to 32 calling convention should preserve esi and edi
#should i follow 32 or 64? also can i just use a different register?

pushq %rdi #push rdi to stack to preserve it
pushq %rsi #push rdi to stack to preserve it

movl $5, %edi 
movl $2, %esi
movl $9, %edx
movl $2, %ecx	

call foo
	
movl %eax, %edi #puts return of foo in first register to ensure it is passed to bar

call bar

popq %rsi #restore original rsi
popq %rdi #restore orignal rdi


#bar doesnt have return value, just prints. what is function of calling ret?


ret


