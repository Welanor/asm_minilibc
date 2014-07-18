[BITS 64]

	global _memmove:function
	section .text

	; void *memmove(void *dest, const void *src, size_t n);
	; rdi -> void* dest
	; rsi -> void* src
	; rdx -> size_t n

	; r8 tmp
	; r9 sens
	; r10 end

_memmove:
	push rbp
	mov rbp, rsp	; function header prologue

	mov rax, rdx ; init var for reverse order
	sub rax, 1
	mov r9, -1
	mov r10, -1

	cmp rdi, rsi
	jg loop_memmove
	xor rax, rax ; init var var for right order
	mov r9, 1
	mov r10, rdx

loop_memmove:
		cmp rax, r10 ; check if we are at the end
		jz memmove_end ; jump out if ok
		mov r8b, [rsi + rax] ; get value from src
		mov [rdi + rax], r8b ; write value in dest
		add rax, r9	; go in sens
jmp loop_memmove
memmove_end:

	mov rax, rdi ; set dest as the return
	mov rsp, rbp ;epilogue
	pop rbp
	ret 0