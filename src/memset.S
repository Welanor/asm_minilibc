[BITS 64]

	global memset, _memset
	section .text

_memset:
memset:
	push rbp
	mov rbp, rsp	; function header

	dec rsi	; decrement

loop_memset:
		mov [rax + rsi], dl	;set value in memory
		dec rsi	;d decrement
		cmp rsi, -1	; check if we have set all data
	jnz loop_memset
memset_end:

	mov rsp, rbp
	pop rbp
	ret 0