section .text
global ft_write
;ssize_t  write(int  fd,  const  void  *buf,  size_t count);
ft_write:
	;prologue
	push rbp
	mov rbp, rsp

	;rdx, rsi, rdi
	;fd, buf, count
	mov rax, 1
	push rbx ;callee saved
	syscall

	;epilogue
	pop rbx
	mov rsp, rbp
	pop rbp
	ret