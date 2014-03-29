[BITS 32]

	global strncat:function, _strncat:function
	section .text

	; char *strncat(char *dest, const char *src, size_t n);
	; edi -> char* dest
	; esi -> char* src
	; edx -> size_t n

_strncat:
strncat:
	push ebp
	mov ebp, esp		; function header prologue

	push edi

	xor eax, eax
	xor ecx, ecx

reach_end_s1:
	mov al, [edi]
	cmp al, 0
	je loop_strncat
	inc edi
	jmp reach_end_s1

loop_strncat:
	mov al, [esi]
	cmp al, 0
	je strncat_end
	cmp ecx, edx
	je strncat_end
	mov [edi], al
	inc esi
	inc edi
	inc ecx
	jmp loop_strncat

strncat_end:

	mov eax, 0
	mov [edi], al

	pop edi

	mov eax, edi		; set dest as the return

	mov esp, ebp 		; epilogue
	pop ebp
	ret 0
