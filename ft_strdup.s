extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

section .text
global ft_strdup

ft_strdup:
	;prologue
	push rbp
	mov rbp, rsp

	push rsi ;caller saved
	call ft_strlen

	;allocate sizeof(char) * strlen(s) bytes
	push rdi
	inc rax
	mov rdi, rax
	push rdi	;malloc zeros this, so i have to save it now to access strlen(src)
	call malloc wrt ..plt
	test rax, rax
	jz .nullptr
	
	;fill newly allocated memory with a valid c string,
	;otherwise strcpy thinks its len=0, so it won't do anything
	xor rcx, rcx
	pop rdi
.loop:
	cmp rcx, rdi ;rdi = len of newly allocated mem
	je .nullterm_cstr
	mov byte [rax + rcx], 65 ;filling string with 'A'
	inc rcx
	jmp .loop

.after_loop:
	pop rsi
	mov rdi, rax
	call ft_strcpy
	
.epilogue:
	pop rsi
	mov rsp, rbp
	pop rbp
	ret

.nullterm_cstr:
	dec rcx
	mov byte [rax + rcx], 0
	jmp .after_loop

.nullptr:
	call __errno_location wrt ..plt
	mov qword [rax], 12	;ENOMEM
	xor rax, rax
	jmp .epilogue