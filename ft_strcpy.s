extern ft_strlen

section .text
global ft_strcpy

;int destlen = strlen(dest);
;int srclen = strlen(src);
;if (srclen + 1 > destlen || src == NULL || dest == NULL) return (dest);
;int i = 0;
;while (src[i])

;char *strcpy(char *dest, const char *src);
ft_strcpy:
	;prologue
	push rbp
	mov rbp, rsp
	push rsi

	;strlen(dest)
	call ft_strlen
	mov rdx, rax ;rdx = strlen(dest)
	
	;strlen(src)
	push rdi
	mov rdi, rsi
	call ft_strlen ;rax = strlen(src)
	pop rdi

	;unfortunately we have to check to see if either string is null
	;even though strlen already checks
	;because we can't distinguish between ft_strlen("") and ft_strlen(NULL)
	;since it will return 0 in both cases.

	cmp rax, rdx ;make sure dest can accomodate src
	jg .error
	test rdi, rdi ;make sure dest isn't NULL
	jz .error
	test rsi, rsi ;make sure src isn't NULL
	jz .error
	
	
	;if src is in range [dest, destlen] -> overlap
	xor rcx, rcx
	cmp rsi, rdi
	je .error	;if src==dest -> error
	cmp rsi, rdi
	jg .src_g_dest
	jmp .src_l_dest

.set_rcx_0:
	xor rcx, rcx

.loop:
	cmp byte [rsi + rcx], 0
	je .add_null_return
	mov al, byte [rsi + rcx]
	mov byte [rdi + rcx], al
	inc rcx
	jmp .loop

.epilogue:
	pop rsi
	mov rsp, rbp
	pop rbp
	ret

;src > dest
.src_g_dest:
	mov rcx, rdi
	add rcx, rdx
	cmp rsi, rcx
	jg .set_rcx_0	;src is not in range [dest, destlen], continue normally
	jmp .error

;src < dest
.src_l_dest:
	mov rcx, rsi
	add rcx, rax
	cmp rdi, rcx
	jg .set_rcx_0	;dest is not in range [src + srclen], continue normally
	jmp .error

.add_null_return:
	mov byte [rdi + rcx], 0
	mov rax, rdi
	jmp .epilogue

.error:
	mov rax, rdi
	jmp .epilogue