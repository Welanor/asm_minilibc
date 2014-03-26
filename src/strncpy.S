[BITS 64]

	global strncpy:function, _strncpy:function
	section .text

	; char *strncpy(char *dest, const char *src, size_t n)
	; rdi -> char* dest
	; rsi -> const char* src
	; rdx -> size_t n

_strncpy:
strncpy:
	push rbp
	mov rbp, rsp		; function header prologue

	xor rax, rax
	xor r8, r8

loop_strncpy:
	cmp rax, rdx 		; check if we are at the end
	je strncpy_end 		; jump out if ok
	mov r8b, [rsi + rax] 	; get value from src
	cmp r8b, 0
	je strncpy_end
	mov [rdi + rax], r8b 	; write value in dest
	inc rax			; increment
	jmp loop_strncpy

strncpy_end:

	mov r8b, 0
	mov [rdi + rax], r8b 	; write null byte

	mov rax, rdi 		; set dest as the return
	mov rsp, rbp 		; epilogue
	pop rbp
	ret 0
