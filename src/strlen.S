[BITS 64]

	global strlen:function
	section .text

	; int strlen(const char *s);
	; rdi -> const char* s

strlen:
	push rbp
	mov rbp, rsp	; function header

	xor rcx, rcx	; init count to 0

loop_strlen:
	mov al, [rdi]
	cmp al, 0		; Check if we are at the end of the string
	je end_strlen		; Jump to the end if it's true
	inc rcx
	inc rdi
	jmp loop_strlen		; Otherwise we continue

end_strlen:
	mov rax, rcx		; Assign the length to rax, to return the value

	mov rsp, rbp ;epilogue
	pop rbp
	ret 0
