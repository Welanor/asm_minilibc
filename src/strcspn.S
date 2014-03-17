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

	xor rax, rax

loop_strcspn :
	mov al, [rdi + rax]
	cmp al, 0 ; check that we are not at end of the string
	je end_loop_strcspn
	mov r8, rsi ; store reject string in r8
	xor r9, r9
check_loop:
	mov cl, [r8 + r9] ; go trought accept string
	cmp cl, al ; check if have find a character
	jne check_if
	jmp end_loop_strcspn ; we found it so lets go out
check_if:
	cmp cl, 0 ; check end of string
	je end_check_loop
	inc r9 ; inc accept string
	jmp check_loop
end_check_loop:

	inc rax
	jmp loop_strcspn		; Otherwise we continue

end_loop_strcspn:

	mov rsp, rbp ;epilogue
	pop rbp
	ret