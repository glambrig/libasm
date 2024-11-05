section .text
global ft_strcpy
extern ft_strlen

;char *strcpy(char *dest, const char *src);
ft_strcpy:
	;prologue
	push rbp
	mov rbp, rsp
	push rdi ;src
	push rsi ;dest

	;function body

	;might be redundant, as strlen checks this
	; cmp rdi, 0	;checking if either is null
	; je .error
	; cmp rsi, 0
	; je .error

	;call strlen on src and dest
	call ft_strlen	;call strlen on src
	mov rcx, rax ;store result of strlen(src) in rcx
	push rbx
	mov rbx, rdi
	mov rdi, rsi
	call ft_strlen	;call strlen on dest
	mov rsi, rdi
	mov rdi, rbx
	pop rbx
	mov rdx, rax ;store result of strlen(dest) in rdx

	;check if dest is large enough to accomodate src
	inc rcx ;since we copy src's \0 too, there has to be space for strlen(src) + 1
	cmp rcx, rdx
	jg .error ;if strlen(src) > strlen(dest), error

	;check if strings overlap in memory
	;if src - dest < strlen(src), then mem overlaps, error
	mov rdx, rdi
	sub rdx, rsi
	cmp rdx, rcx
	jl .error

	xor rcx, rcx
;iterate through src, copy into dest
.loop:
	cmp byte [rdi + rcx], 0x0
	je .copy_null_return
	mov rdx, [rdi + rcx]
	mov [rsi + rcx], rdx
	inc rcx
	jmp .loop

;returns dest, not null
.error:
	mov rax, rsi
	jmp .epilogue

;copies the null terminator into dest and returns
.copy_null_return:
	mov byte [rsi + rcx], 0x0
	jmp .epilogue

.epilogue:
	pop rsi
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
