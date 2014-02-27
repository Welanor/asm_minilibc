[BITS 64]

	global memmove:function, _memmove:function
	section .text

	; void *memmove(void *dest, const void *src, size_t n);
	; rdi -> void* dest
	; rsi -> void* src
	; rdx -> size_t n

_memmove:
memmove:
	push rbp
	mov rbp, rsp	; function header prologue

	cmp rsi, rdi
	jg reverse_loop

	xor rax, rax
loop_memmove:
		cmp rax, rdx ; check if we are at the end
		jz memmove_end ; jump out if ok
		mov r8b, [rsi + rax] ; get value from src
		mov [rdi + rax], r8b ; write value in dest
		inc rax	; increment
jmp loop_memmove

reverse_loop:
	dec rdx ; decrement rdx to not got write outside
rloop_memmove:
		cmp rdx, -1 ; check if we are at the end
		jz memmove_end ; jump out if ok
		mov r8b, [rsi + rdx] ; get value from src
		mov [rdi + rdx], r8b ; write value in dest
		dec rdx	; decrement
jmp rloop_memmove

memmove_end:

	mov rax, rdi ; set dest as the return
	mov rsp, rbp ;epilogue
	pop rbp
	ret 0