.section .data
.globl  numbers                # mark as global (necessary)
.globl  n

numbers:   .long   1, 5, 8     # array values
n:         .long   3           # length of numbers array
.section .text
	.global _start

_start:

	xor %ebx, %ebx # clear ebx for sum
	movl n, %edi #puts n's value (3) for max index
	movl $0, %ecx #defines starting index

.loop:
	movl numbers(,%ecx,4), %eax #puts number at index[ecx] in eax

	incl %ecx #increment index #0->1++
	addl %eax, %ebx #add number at ecx to ebx
	cmpl %edi,%ecx #compare 3-1++ edi-ecx
	jl .loop

end: 
	movl $1, %eax
	int $0x80
