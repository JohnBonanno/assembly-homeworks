.section .text

    .globl password
    .globl message
    .globl msglength
    .globl eq
    .globl good
    .globl end
    .globl pass
    .globl _start 
_start:

jmp username #unconditional jmp username

username:

mov $message, %edi 	#point to msg with first register
mov %edi, %ecx     	#put msg to print in char user buffer
mov msglength, %edx	#gives buffer size of msglength
call printStr		#call print, read, read jumps to end if username found
call readStr 	    	
mov $password, %edi 
mov %edi, %ecx 
mov msglength, %edx
call printStr 
mov $3, %eax
mov $2, %ebx
int $0x80
jmp end
   

good:

mov $eq, %edi
mov %edi, %ecx
mov msglength, %edx
call printStr #prints $eq
jmp end #unconditional jmp end

pass: 			#jumps into print password after printing username prompt

mov $password, %edi     #put pwd in edi
mov %edi, %ecx 		#puts message address in char buffer register
mov msglength, %edx 	#of len
call printStr 		#prints
mov $3, %eax		#read
mov $2, %ebx		#from stdin
int $0x80		#now

mov $pa, %esi		# password in esi
mov %ecx,%edi		# stdin in edi
mov $20,%ecx	
cld			# clear flag D
rep  cmpsb		# cmp
jz good			# if eq jmp good for confirmation msg



end: 

mov $1, %eax  #tells syscall to exit
mov $0, %ebx  #sets exit code as 0
int $0x80 

.section .data
pa: .ascii "strawberrybananacake"
password: .ascii "please enter password: "
plen: .word 5
eq: .ascii "correct user and pass  "
message: .ascii "please enter username: "
msglength: .word 23
