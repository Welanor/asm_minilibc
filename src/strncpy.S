[BITS 64]

	global strncpy:function
	section .text

	; char *strncpy(char *dest, const char *src, size_t n)
	; rdi -> char* dest
	; rsi -> const char* src
	; rdx -> size_t n

strncpy:
	push rbp
	mov rbp, rsp		; function header prologue

	xor rcx, rcx
	xor r8, r8

loop_strncpy:
	cmp rcx, rdx 		; check if we are at the end
	je strncpy_end 		; jump out if ok
	mov r8b, [rsi + rcx] 	; get value from src
	cmp r8b, 0
	je strncpy_end
	mov [rdi + rcx], r8b 	; write value in dest
	inc rcx			; increment
	jmp loop_strncpy

strncpy_end:

	xor r8, r8
	mov [rdi + rcx], r8b 	; write null byte

	mov rax, rdi 		; set dest as the return
	mov rsp, rbp 		; epilogue
	pop rbp
	ret 0
