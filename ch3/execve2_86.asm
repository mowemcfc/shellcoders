; ld -m elf_i386 -o execve2_86 execve2_86.o
; nasm -f elf execve2_86.asm

Section	.text
	global _start
_start:
	xor eax, eax 	; zero out eax
	push eax     	; stack alignment(??)
	push 0x68732f6e 
  	push 0x69622f2f ; /bin//sh string
	mov ebx, esp    ; set ebx to addr of string
	push eax	; argv[1] = NULL
	push ebx	; argv[0] = &/bin//sh
	mov ecx, esp	; set ecx to addr of argv
	push 0xb	; syscall 11 = execve
	pop eax		; pop syscall no into eax
	int 0x80	; interrupt




