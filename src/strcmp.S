[BITS 64]

	global strcmp:function, _strcmp:function
	section .text

_strcmp:
strcmp:
	push rbp
	mov rbp, rsp	; function header

	push rdi	; save rdi
	push rsi	; save rsi

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
	sub rax, r8

	pop rsi 	; restore rsi
	pop rdi		; restore rdi
	pop rbp
	ret 0
