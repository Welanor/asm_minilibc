[BITS 32]

	global strcat:function, _strcat:function
	section .text

	; char *strcat(char *dest, const char *src);
	; edi -> char* dest
	; esi -> char* src

_strcat:
strcat:
	push ebp
	mov ebp, esp		; function header prologue

	xor eax, eax

reach_end_s1:
	mov al, [edi]
	cmp al, 0
	je loop_strcat
	inc edi
	jmp reach_end_s1

loop_strcat:
	mov al, [esi]
	cmp al, 0
	je strcat_end
	mov [edi], al
	inc esi
	inc edi
	jmp loop_strcat

strcat_end:

	mov [edi], al

	mov eax, edi		; set dest as the return

	mov esp, ebp 		; epilogue
	pop ebp
	ret 0
