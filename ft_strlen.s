section .text
global ft_strlen	;enables external linkage
ft_strlen:
	;subroutine prologue
	push rbp
	mov rbp, rsp
	xor rcx, rcx ;rcx is the counter register, zero it before use

	cmp qword rdi, 0
	je .error
.loop:
	cmp byte [rdi + rcx], 0x0
	je .finish
	inc rcx
	jmp .loop

.error:	;pointer passed is null
	mov rax, 0
	jmp .epilogue

.finish:
	mov rax, rcx

.epilogue:
	mov rsp, rbp
	pop rbp
	ret
