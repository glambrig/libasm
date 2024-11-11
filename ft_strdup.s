extern malloc
extern ft_strlen
extern strcpy
; extern ft_strcpy
extern __errno_location

section .text
global ft_strdup

ft_strdup:
	;prologue
	push rbp
	mov rbp, rsp

	;body
	push rsi ;caller saved
	call ft_strlen

	;allocate sizeof(char) * strlen(s) bytes
	push rdi
	mov rdi, rax
	inc rax
	call malloc wrt ..plt
	test rax, rax
	jz .nullptr
	
	;call strcpy
	pop rsi
	mov rdi, rax
	call strcpy wrt ..plt
	; call ft_strcpy
	
.epilogue:
	pop rsi
	mov rsp, rbp
	pop rbp
	ret

.nullptr:
	call __errno_location wrt ..plt
	mov qword [rax], 12	;ENOMEM
	xor rax, rax
	jmp .epilogue