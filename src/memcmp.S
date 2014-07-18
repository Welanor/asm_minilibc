[BITS 64]

	global _memcmp:function
	section .text

	; int memcmp(const void *ptr1, const void *ptr2, size_t num);
	; rdi -> const char *ptr1
	; rsi -> const char *ptr2
	; rdx -> size_t num

_memcmp:
	push rbp
	mov rbp, rsp	; function header

	xor r8, r8
	xor rax, rax
	cmp rdx, 0
	je end_memcmp
	dec rdx

loop_memcmp:
	mov rax, [rdi]
	mov r8, [rsi]
	cmp rax, r8		; Check if the mem is equal
	jne end_memcmp		; Jump to the end if it's false
	inc rsi
	inc rdi
	dec rdx
	cmp rdx, -1
	je end_memcmp
	jmp loop_memcmp	; Otherwise we continue

end_memcmp:
	sub rax, r8

	mov rsp, rbp ;epilogue
	pop rbp
	ret 0
