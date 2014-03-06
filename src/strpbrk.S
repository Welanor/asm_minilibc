[BITS 64]

	global strpbrk:function, _strpbrk:function
	section .text

	; char *strpbrk(const char *s, const char *accept);
	; rdi -> const char* s
	; rsi -> const char *accept

_strpbrk:
strpbrk:
	push rbp
	mov rbp, rsp		; function header



	mov rsp, rbp ;epilogue
	pop rbp
	ret

