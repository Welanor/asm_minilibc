[BITS 64]

	global strchr:function
	section .text

	; char *strchr(const char *s, int c);
	; rdi -> const char* s
	; rsi -> int c

strchr:
	push rbp
	mov rbp, rsp		; function header
	push rdi

loop_strchr:
	mov al, [rdi]
	cmp al, sil
	je end_found
	cmp al, 0		; Check if we are at the end of the string
	je end_error		; Jump to the end if it's true
	inc rdi
	jmp loop_strchr		; Otherwise we continue

end_error:
	mov rax, 0		; Return NULL
	jmp end

end_found:
	mov rax, rdi		; Return rdi

end:

	pop rdi
	mov rsp, rbp ;epilogue
	pop rbp
	ret
