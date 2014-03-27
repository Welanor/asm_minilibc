[BITS 64]

	global memchr:function, _memchr:function
	section .text

	; void *memchr(const void *s, int c, size_t n);
	; rdi -> const char* s
	; rsi -> int c
	; rdx -> size_t n

_memchr:
memchr:
	push rbp
	mov rbp, rsp		; function header

	xor rcx, rcx ; count with rcx
	cmp rdx, 0
	je end_error

loop_memchr:
	mov al, [rdi]
	cmp al, sil
	je end_found
	inc rdi
	inc rcx
	cmp rdx, rcx		; Check if we are at the end of the mem
	je end_error		; Jump to the end if it's true
	jmp loop_memchr		; Otherwise we continue

end_error:
	mov rax, 0		; Return NULL
	jmp end

end_found:
	mov rax, rdi		; Return rdi

end:

	mov rsp, rbp ;epilogue
	pop rbp
	ret
