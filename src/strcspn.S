[BITS 64]

	global strcspn:function, _strcspn:function
	section .text

	; size_t strcspn(const char *s, const char *reject);
	; rdi -> const char* s
	; rsi -> const char *reject

_strcspn:
strcspn:
	push rbp
	mov rbp, rsp		; function header


	mov rsp, rbp ;epilogue
	pop rbp
	ret