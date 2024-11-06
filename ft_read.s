section .text
global ft_read
;ssize_t read(int fd, void *buf, size_t count);
ft_read:
	;prologue
	push rbp
	mov rbp, rsp

	push rdi
	push rsi
	push rdx
	push rbx ;callee saved
	mov rax, 0
	syscall

	pop rbx
	pop rdx
	pop rsi
	pop rdi
	mov rsp, rbp
	pop rbp
	ret