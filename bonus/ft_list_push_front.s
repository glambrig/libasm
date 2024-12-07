extern malloc

section .text
global ft_list_push_front
;void ft_list_push_front(t_list **begin_list, void *data);
;add new element to the front of the list, i.e. first node
ft_list_push_front:
	;prologue
	push rbp
	mov rbp, rsp
	sub rsp, 8

	;some null checks
	cmp rdi, 0
	je .epilogue
	cmp rsi, 0
	je .epilogue

	;allocate memory for new node
	push rdi
	push rsi
	mov rdi, 16	;hard coding it for now, but sizeof(t_list) would be nicer
	sub rsp, 8
	call malloc wrt ..plt
	add rsp, 8
	cmp rax, 0
	je .epilogue
	pop rsi
	pop rdi

	;put data into malloc'd location
	mov [rax], rsi

	;move new node to the front of the list
	;check if list is empty
	cmp qword [rdi], 0
	je .empty_list

.add_new_node:
	;have my new node point to the first node
	mov rdx, [rdi]
	mov [rax + 8], rdx
	;move the head of the list to point to my node
	mov [rdi], rax
	jmp .epilogue

.empty_list:
	mov [rdi], rax
	mov qword [rax + 8], 0

.epilogue:
	add rsp, 8
	mov rsp, rbp
	pop rbp
	ret