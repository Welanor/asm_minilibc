[BITS 64]

	global strncmp:function, _strncmp:function
	section .text

	; int strncmp(const char *s1, const char *s2, size_t n);
	; rdi -> const char *s1
	; rsi -> const char *s2
	; rdx -> size_t n

_strncmp:
strncmp:
	push rbp
	mov rbp, rsp	; function header

	mov r8, 0
	mov rax, 0
	mov rcx, 0
	cmp rdx, 0
	je end_strncmp

loop_strncmp:
	mov al, [rdi]
	mov r8b, [rsi]
	cmp al, r8b		; Check if the string is equal
	jne end_strncmp		; Jump to the end if it's false
	cmp al, 0		; Check if we are at the end of the string
	je end_strncmp		; Jump to the end if it's true
	cmp r8b, 0		; Check if we are at the end of the string
	je end_strncmp		; Jump to the end if it's true
	inc rsi
	inc rdi
	inc rcx
	cmp rcx, rdx
	je end_strncmp
	jmp loop_strncmp	; Otherwise we continue

end_strncmp:
	sub al, r8b
	movsx rax, al ; mov signed extend

	mov rsp, rbp ;epilogue
	pop rbp
	ret 0
