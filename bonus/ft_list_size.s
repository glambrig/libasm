; int ft_lstsize(t_list *lst)

global ft_list_size
section .text
ft_list_size:
	;prologue
	push rbp
	mov rbp, rsp
	push rdi

	xor rax, rax
.loop:
	cmp rdi, 0
	je .epilogue
	inc rax
	mov rdi, [rdi + 8]
	jmp .loop

.epilogue:
	pop rdi
	mov rsp, rbp
	pop rbp