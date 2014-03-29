[BITS 32]

	global memset:function, _memset:function
	section .text

	; void *memset(void *s, int c, size_t n);
	; edi -> void* s
	; esi -> int c
	; edx -> size_t n

_memset:
memset:
	push ebp
	mov ebp, esp	; function header prologue

	xor eax, eax
loop_memset:
		cmp eax, edx ; check if we are at the end
		je memset_end ; jump out if ok
		mov [edi + eax], sil ; set value in memory
		inc eax	; increment
jmp loop_memset
memset_end:

	mov eax, edi
	mov esp, ebp ;epilogue
	pop ebp
	ret 0