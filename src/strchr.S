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
	cmp al, sil
	je end_found
	cmp al, 0		; Check if we are at the end of the string
	je end_error		; Jump to the end if it's true
	inc rdi
	jmp loop_strchr		; Otherwise we continue

end_error:
	mov rax, 0		; Return NULL
	jmp end

end_found:
	mov rax, rdi		; Return rdi

end:
	pop rsi
	pop rdi
	pop rbp
	ret
