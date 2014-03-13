[BITS 64]

	global strcasecmp:function, _strcasecmp:function
	section .text

_strcasecmp:
strcasecmp:
	push rbp
	mov rbp, rsp	; function header

	push rdi	; save rdi
	push rsi	; save rsi

	xor r8, r8
	xor rax, rax

loop_strcasecmp:
	mov al, [rdi]
	mov r8b, [rsi]
	jmp case

suite:
	inc rsi
	inc rdi
	cmp al, 0			; Check if we are at the end of the string
	je end_strcasecmp		; Jump to the end if it's true
	cmp r8b, 0			; Check if we are at the end of the string
	je end_strcasecmp		; Jump to the end if it's true
	jmp loop_strcasecmp		; Otherwise we continue

end_strcasecmp:
	sub rax, r8

	pop rsi 	; restore rsi
	pop rdi		; restore rdi

	mov rsp, rbp 	; epilogue
	pop rbp
	ret 0

case:
	cmp al, r8b		; Check if the string is equal
	je suite		; Jump to the end if it's false
	cmp r8b, 90
	jg lower
	jmp upper

lower:
	cmp al, 65
	jl end_strcasecmp
	cmp al, 90
	jg end_strcasecmp
	add rax, 32
	cmp al, r8b		; Check if the string is equal
	je suite		; Jump to the end if it's false
	jmp end_strcasecmp

upper:
	cmp al, 97
	jl end_strcasecmp
	cmp al, 122
	jg end_strcasecmp
	sub rax, 32
	cmp al, r8b		; Check if the string is equal
	je suite		; Jump to the end if it's false
	jmp end_strcasecmp
