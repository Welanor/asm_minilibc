[BITS 64]

	global strchr, _strchr
	section .text

_strchr:
strchr:
	push rbp
	mov rbp, rsp		; function header
	push rdi		; save rdi
	push rsi		; save rsi

loop_strchr:
	mov al, [rdi]
	cmp al, 0		; Check if we are at the end of the string
	je end_error		; Jump to the end if it's true
	cmp al, [rsi]
	je end_found
	inc rdi
	jmp loop_strchr		; Otherwise we continue

end_error:
	mov rax, 0		; Assign the length to rax, to return the value
	jmp end

end_found:
	mov rax, rdi

end:
	pop rdi			; restore rdi
	pop rbp
	ret
