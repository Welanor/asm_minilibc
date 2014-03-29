[BITS 32]

	global memchr:function, _memchr:function
	section .text

	; void *memchr(const void *s, int c, size_t n);
	; edi -> const char* s
	; esi -> int c
	; edx -> size_t n

_memchr:
memchr:
	push ebp
	mov ebp, esp		; function header

	xor ecx, ecx ; count with ecx
	cmp edx, 0
	je end_error

loop_memchr:
	mov al, [edi]
	cmp al, sil
	je end_found
	inc edi
	inc ecx
	cmp edx, ecx		; Check if we are at the end of the mem
	je end_error		; Jump to the end if it's true
	jmp loop_memchr		; Otherwise we continue

end_error:
	mov eax, 0		; Return NULL
	jmp end

end_found:
	mov eax, edi		; Return edi

end:

	mov esp, ebp ;epilogue
	pop ebp
	ret
