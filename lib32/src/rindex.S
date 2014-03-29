[BITS 32]

	global rindex:function, _rindex:function
	extern _strlen
	section .text

	; char *rindex(const char *s, int c);
	; edi -> const char* s
	; esi -> int c

_rindex:
rindex:
	push ebp
	mov ebp, esp		; function header

	push edi ; save edi
	push esi ; save esi

	call _strlen wrt ..plt
	mov ecx, eax
	dec ecx

loop_rindex:
	mov al, [edi+ecx]
	cmp al, sil
	je end_found
	cmp al, 0		; Check if we are at the end of the string
	je end_error		; Jump to the end if it's true
	dec ecx
	jmp loop_rindex		; Otherwise we continue

end_error:
	mov eax, 0		; Return NULL
	jmp end

end_found:
	add edi, ecx
	mov eax, edi		; Return edi

end:

	pop edi ; restore edi
	pop esi ; restore esi
	mov esp, ebp ;epilogue
	pop ebp
	ret
