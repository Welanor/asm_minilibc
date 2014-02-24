[BITS 64]

	global strlen, _strlen
	section .text

_strlen:
strlen:
	push rbp
	mov rbp, rsp

	mov rax, 1
	mov rdi, 1
	mov rsi, FormatStr
	mov rdx, 13
	syscall

	mov rcx, 0

loop_strlen:
	cmp rdi, 0
	mov rdx, rdi
	add rdx, 1
	mov rdi, rdx
	je loop_strlen

	pop rbp
	mov rax, rcx
	ret

	section .rodata
	FormatStr db 'Hello World !',0Ah,0
