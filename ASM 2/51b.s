    .section .text
    .global _start 
_start: 
	
    xorl %ebx, %ebx #clears second register
    xorl %ecx, %ecx #clears third register

.loop:

    addl  $1, %ecx #increment third register (count)
    addl %ecx, %ebx #add value of count to sys call register 0+1+2+3+4
    cmpl  %eax, %ecx #compare 4=>0+1... at 4 will no longer jmp
    jne  .loop 
 	
end:
movl $1, %eax
int $0x80
