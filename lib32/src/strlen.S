[BITS 32]

	global strlen:function, _strlen:function
	section .text

	; int strlen(const char *s);
	; edi -> const char* s

_strlen:
strlen:
	push ebp
	mov ebp, esp	; function header

	xor ecx, ecx	; init count to 0

loop_strlen:
	mov al, [edi]
	cmp al, 0		; Check if we are at the end of the string
	je end_strlen		; Jump to the end if it's true
	inc ecx
	inc edi
	jmp loop_strlen		; Otherwise we continue

end_strlen:
	mov eax, ecx		; Assign the length to eax, to return the value

	mov esp, ebp ;epilogue
	pop ebp
	ret 0
