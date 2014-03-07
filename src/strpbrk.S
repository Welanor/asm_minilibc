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

loop_strpbrk:
	mov al, [rdi]
	cmp al, 0 ; check that we are not at end of the string
	je end_loop_strpbrk
	mov r8, rsi
check_loop:
	mov cl, [r8] ; go trought accept string
	cmp cl, al
	jne check_if
     mov rax, rdi ; set return as stuff
     jmp end_loop_strpbrk
check_if:
	cmp cl, 0
	je end_check_loop
	jmp check_loop
end_check_loop:

	inc rdi
	jmp loop_strpbrk		; Otherwise we continue
end_loop_strpbrk:

	mov rsp, rbp ;epilogue
	pop rbp
	ret
