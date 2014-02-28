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

	xor rax, rax
loop_memset:
		cmp rax, rdx ; check if we are at the end
		je memset_end ; jump out if ok
		mov [rdi + rax], sil ; set value in memory
		inc rax	; increment
jmp loop_memset
memset_end:

	mov rax, rdi
	mov rsp, rbp ;epilogue
	pop rbp
	ret 0