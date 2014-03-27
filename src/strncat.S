[BITS 64]

	global strncat:function, _strncat:function
	section .text

	; char *strncat(char *dest, const char *src, size_t n);
	; rdi -> char* dest
	; rsi -> char* src
	; rdx -> size_t n

_strncat:
strncat:
	push rbp
	mov rbp, rsp		; function header prologue

	push rdi

	xor rax, rax
	xor rcx, rcx

reach_end_s1:
	mov al, [rdi]
	cmp al, 0
	je loop_strncat
	inc rdi
	jmp reach_end_s1

loop_strncat:
	mov al, [rsi]
	cmp al, 0
	je strncat_end
	cmp rcx, rdx
	je strncat_end
	mov [rdi], al
	inc rsi
	inc rdi
	inc rcx
	jmp loop_strncat

strncat_end:

	mov rax, 0
	mov [rdi], al

	pop rdi

	mov rax, rdi		; set dest as the return

	mov rsp, rbp 		; epilogue
	pop rbp
	ret 0
