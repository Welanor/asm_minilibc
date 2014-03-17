[BITS 64]

	global strstr:function, _strstr:function
	section .text

	; char *strstr(const char *haystack, const char *needle);
	; rdi -> const char *haystack
	; rsi -> const char *needle

_strstr:
strstr:
	push rbp
	mov rbp, rsp	; function header

loop_strstr:
	mov al, [rdi]
	cmp al, [rsi]
	je init_cmp
test_end:
	cmp al, 0		; Check if we are at the end of the string
	je error_strstr		; Jump to the end if it's true
	inc rdi
	jmp loop_strstr		; Otherwise we continue

find_str:
	mov rax, rdi
	jmp end_strstr

error_strstr:
	mov rax, 0		; Assign the pointer on rdi to rax, to return the value

end_strstr:

	mov rsp, rbp ;epilogue
	pop rbp
	ret 0

init_cmp:
	xor rcx, rcx

loop_test:
	mov al, [rdi + rcx]
	mov r8b, [rsi + rcx]
	cmp r8b, 0
	je find_str
	cmp al, r8b
	jne test_end
	inc rcx
	jmp loop_test
