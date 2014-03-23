[BITS 64]

	global strcat:function, _strcat:function
	section .text

	; char *strcat(char *dest, const char *src);
	; rdi -> char* dest
	; rsi -> char* src

_strcat:
strcat:
	push rbp
	mov rbp, rsp		; function header prologue

	push rdi
	push rsi

	xor rax, rax

reach_end_s1:
	mov al, [rdi]
	cmp al, 0
	je loop_strcat
	inc rdi
	jmp reach_end_s1

loop_strcat:
	mov al, [rsi]
	cmp al, 0
	je strcat_end
	mov [rdi], al
	inc rsi
	inc rdi
	jmp loop_strcat

strcat_end:

	mov [rdi], al
	pop rsi
	pop rdi

	mov rax, rdi		; set dest as the return

	mov rsp, rbp 		; epilogue
	pop rbp
	ret 0
