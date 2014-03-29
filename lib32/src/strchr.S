[BITS 32]

	global strchr:function, _strchr:function
	section .text

	; char *strchr(const char *s, int c);
	; edi -> const char* s
	; esi -> int c

_strchr:
strchr:
	push ebp
	mov ebp, esp		; function header
	push edi

loop_strchr:
	mov al, [edi]
	cmp al, sil
	je end_found
	cmp al, 0		; Check if we are at the end of the string
	je end_error		; Jump to the end if it's true
	inc edi
	jmp loop_strchr		; Otherwise we continue

end_error:
	mov eax, 0		; Return NULL
	jmp end

end_found:
	mov eax, edi		; Return edi

end:

	pop edi
	mov esp, ebp ;epilogue
	pop ebp
	ret
