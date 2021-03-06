[BITS 64]

	global rindex:function
	extern strlen
	section .text

	; char *rindex(const char *s, int c);
	; rdi -> const char* s
	; rsi -> int c

rindex:
	push rbp
	mov rbp, rsp		; function header

	push rdi ; save rdi
	push rsi ; save rsi

	call strlen wrt ..plt
	mov rcx, rax
	dec rcx

	pop rsi ; restore rsi
	pop rdi ; restore rdi

loop_rindex:
	mov al, [rdi+rcx]
	cmp al, sil
	je end_found
	cmp al, 0		; Check if we are at the end of the string
	je end_error		; Jump to the end if it's true
	dec rcx
	jmp loop_rindex		; Otherwise we continue

end_error:
	mov rax, 0		; Return NULL
	jmp end

end_found:
	add rdi, rcx
	mov rax, rdi		; Return rdi

end:

	mov rsp, rbp ;epilogue
	pop rbp
	ret
