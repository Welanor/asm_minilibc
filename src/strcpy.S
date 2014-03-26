[BITS 64]

	global strcpy:function, _strcpy:function
	extern _memcpy, _strlen
	section .text

	; char *strcpy(char *dest, const char *src);
	; rdi -> char* dest
	; rsi -> const char* src

_strcpy:
strcpy:
	push rbp
	mov rbp, rsp

	push rdi

	mov rdi, rsi
	call _strlen wrt ..plt	; call strlen

	inc rax			; add the null terminated byte to the cpy
	pop rdi			; reset rdi

	mov rdx, rax
	call _memcpy wrt ..plt 	; call memcpy

	mov rsp, rbp 		; epilogue
	pop rbp
	ret 0
