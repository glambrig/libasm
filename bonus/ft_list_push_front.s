global ft_list_push_front
section .text
;void ft_list_push_front(t_list **begin_list, void *data);
;add new element to the front of the list, i.e. first node
ft_list_push_front:
	;prologue
	push rbp
	mov rbp, rsp
	push rbx

	;some null checks
	cmp rsi, 0
	je .epilogue
	cmp rdi, 0
	je .epilogue

epilogue:
	pop rbx
	mov rsp, rbp
	pop rbp