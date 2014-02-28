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

	xor rax, rax
loop_memcpy:
		cmp rax, rdx ; check if we are at the end
		je memcpy_end ; jump out if ok
		mov r8b, [rsi + rax] ; get value from src
		mov [rdi + rax], r8b ; write value in dest
		inc rax	; increment
jmp loop_memcpy
memcpy_end:

	mov rax, rdi ; set dest as the return
	mov rsp, rbp ;epilogue
	pop rbp
	ret 0