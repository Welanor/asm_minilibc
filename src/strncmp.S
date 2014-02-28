[BITS 64]

	global strncmp:function, _strncmp:function
	section .text

_strncmp:
strncmp:
	push rbp
	mov rbp, rsp	; function header

	push rdi	; save rdi
	push rsi	; save rsi
	push rdx	; save rdx

	mov r8, 0
	mov rax, 0
	mov rcx, 0

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
	sub rax, r8

	pop rdx		; restore rdx
	pop rsi 	; restore rsi
	pop rdi		; restore rdi
	pop rbp
	ret 0
