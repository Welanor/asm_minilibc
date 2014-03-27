[BITS 64]

	global strcasecmp:function, _strcasecmp:function
	section .text

	; int strcasecmp(const char *s1, const char *s2);
	; rdi -> const char* s1
	; rsi -> const char *s2

_strcasecmp:
strcasecmp:
	push rbp
	mov rbp, rsp	; function header

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

	mov rsp, rbp 	; epilogue
	pop rbp
	ret 0

case:
	cmp al, r8b		; Check if the string is equal
	je suite		; Jump to the end if it's false
	cmp r8b, 65
	jl lower_s1
	cmp r8b, 90
	jle lower_s2
	jmp lower_s1

lower_s1:
	cmp al, 65
	jl end_strcasecmp
	cmp al, 90
	jg end_strcasecmp
	add rax, 32
	cmp al, r8b		; Check if the string is equal
	je suite		; Jump to the end if it's false
	jmp end_strcasecmp

lower_s2:
	cmp r8b, 65
	jl end_strcasecmp
	cmp r8b, 90
	jg end_strcasecmp
	add r8, 32
	cmp al, r8b		; Check if the string is equal
	je suite		; Jump to the end if it's false
	jmp end_strcasecmp
