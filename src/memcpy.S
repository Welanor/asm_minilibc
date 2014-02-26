[BITS 64]

	global memcpy:function, _memcpy:function
	section .text

	; void *memcpy(void *dest, const void *src, size_t n);
	; rdi -> void* dest
	; rsi -> void* src
	; rdx -> size_t n

_memcpy:
memcpy:
	push rbp
	mov rbp, rsp	; function header prologue

	cmp rdx, 0	; n > 0 ?
	jng memcpy_end	; else we quit
	dec rdx ; decrement
loop_memcpy:
		mov rax, [rsi + rdx]	; stock value in rax
		mov [rdi + rdx], al	;set value in memory
		dec rdx	; decrement
		cmp rdx, -1	; check if we have set all data
jnz loop_memcpy
memcpy_end:

	mov rax, rdi ; return dest
	mov rsp, rbp ; epilogue
	pop rbp
	ret 0