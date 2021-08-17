; nasm -f elf64 execve2.asm
; ld -o execve2 execve2.o
section    .text
	global _start

_start:
	push		rax		; stack alignment (previous call pushes 8 bytes to stack - ABI requires 16-byte align)
	xor		rdx,rdx		; zero out rdx (arg3)
	xor		rsi,rsi		; zero out rsi
	mov             rbx,'/bin//sh'	; set arg 1 to /bin//sh
	push 		rbx		; place /bin//sh on stack so that we can ...
	push 		rsp		; ... put the address of it on the stack too
	pop 		rdi		; and pop this address into rdi (arg 2)
	mov             al,0x3b         ; syscall no 59 = execve
	syscall				; trigger syscall

