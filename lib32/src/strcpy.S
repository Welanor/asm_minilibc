[BITS 32]

	global strcpy:function, _strcpy:function
	extern _memcpy, _strlen
	section .text

	; char *strcpy(char *dest, const char *src);
	; edi -> char* dest
	; esi -> const char* src

_strcpy:
strcpy:
	push ebp
	mov ebp, esp

	push edi

	mov edi, esi
	call _strlen wrt ..plt	; call strlen

	inc eax			; add the null terminated byte to the cpy
	pop edi			; reset edi

	mov edx, eax
	call _memcpy wrt ..plt 	; call memcpy

	mov esp, ebp 		; epilogue
	pop ebp
	ret 0
