#username: "alinuxcmpt8773934448"                   
#pass: "strawberrybananacake"
.section .text
.globl readStr
.globl printStr
#write = 4
#read = 3
#exit = 1

printStr: 
    mov $4,%eax   #write sys call by moving 0x04 into eax
    mov $1,%ebx   #write to std out
    int $0x80     # invoke syscall
    ret

    
readStr:

   mov $3, %eax  # read sys call 
   mov $2, %ebx  #reading from stdout is gonna happen next sys call
   int  $0x80 	  #string from STDIN will now be pointed to by %ecx
   
   mov  %ecx,%edi #put first string in first register
   mov  $p, %esi  #%let %esi point to address of string in p
   mov  $20, %ecx #%cl should point to first char of p
   cld
   rep cmpsb
   jz pass  
   ret
   
.section .data 
	BUFFER: .space 80 
	len: .word 4 
	p: .ascii "alinuxcmpt8773934448"

