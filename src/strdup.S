[BITS 64]

	global strdup:function
	extern strlen, memcpy, malloc
	section .text

	; char *strdup(const char *s);
	; rdi -> const char* s

strdup:
	push rbp
	mov rbp, rsp		; function header

	push rdi ; save rdi

	call strlen wrt ..plt ; call strlen
	add rax, 1 ; add \0 space
	push rax ; conserve string size
	mov rdi, rax ; set malloc param
	call malloc wrt ..plt ; call malloc
	pop r9 ; restore size in r9
	pop r8 ; restore rdi in r8
	cmp rax, 0
	je end_strdup

	mov rdi, rax ; dest <- rax
	mov rsi, r8 ; src <- r8
	mov rdx, r9 ; n <- r9
	call memcpy wrt ..plt ; call memcpy
end_strdup:

	mov rsp, rbp ;epilogue
	pop rbp
	ret
