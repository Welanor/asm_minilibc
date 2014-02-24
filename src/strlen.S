[BITS 64]

	global strlen, _strlen
	section .text

_strlen:
strlen:
	push rbp
	mov rbp, rsp

	mov rcx, 0		; init count to 0

loop_strlen:
	mov al, [rdi]
	cmp al, 0		; Check if we are at the end of the string
	je end_strlen		; Jump to the end if it's true
	inc rcx
	inc rdi
	jmp loop_strlen		; Otherwise we continue

end_strlen:

	mov rax, rcx		; Assign the length to rax, to return the value

	pop rbp
	ret
