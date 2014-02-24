[BITS 64]

 ; The general register EBX, ESI, EDI, EBP, DS, ES, and SS, must be preserved by the called function

	global memset, _memset
	section .text

_memset:
memset:
	push rbp
	mov rbp, rsp	; function header

	dec rsi	; decrement

loop_memset:
		mov [rax + rsi], dl	;set value in memory
		dec rsi	; decrement
		cmp rsi, -1	; check if we have set all data
jnz loop_memset

	mov rsp, rbp
	pop rbp
	ret 0