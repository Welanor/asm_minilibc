[BITS 64]

	global memset:function, _memset:function
	section .text

	; void *memset(void *s, int c, size_t n);
	; rdi -> void* s
	; rsi -> int c
	; rdx -> size_t n

_memset:
memset:
	push rbp
	mov rbp, rsp	; function header prologue

	mov rax, rsi	; use rax instead rsi
	cmp rdx, 0	; n > 0 ?
	jng memset_end	; else we quit
	dec rdx ; decrement
loop_memset:
		mov [rdi + rdx], al	;set value in memory
		dec rdx	; decrement
		cmp rdx, -1	; check if we have set all data
jnz loop_memset
memset_end:

	mov rax, rdi
	mov rsp, rbp ;epilogue
	pop rbp
	ret 0