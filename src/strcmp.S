[BITS 64]

	global strcmp:function, _strcmp:function
	section .text

	; int strcmp(const char *s1, const char *s2);
	; rdi -> void* s1
	; rsi -> void* s2

_strcmp:
strcmp:
	push rbp
	mov rbp, rsp	; function header

	mov r8, 0
	mov rax, 0

loop_strcmp:
	mov al, [rdi]
	mov r8b, [rsi]
	cmp al, r8b		; Check if the string is equal
	jne end_strcmp		; Jump to the end if it's false
	cmp al, 0		; Check if we are at the end of the string
	je end_strcmp		; Jump to the end if it's true
	cmp r8b, 0		; Check if we are at the end of the string
	je end_strcmp		; Jump to the end if it's true
	inc rsi
	inc rdi
	jmp loop_strcmp		; Otherwise we continue

end_strcmp:
	sub al, r8b
	movsx rax, al ; mov signed extend

	mov rsp, rbp ;epilogue
	pop rbp
	ret 0
