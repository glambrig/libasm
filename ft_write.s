section .text
global ft_write
;ssize_t  write(int  fd,  const  void  *buf,  size_t count);
	;rdx, rsi, rdi
	;fd, buf, count
ft_write:
	;prologue
	push rbp
	mov rbp, rsp

	push rdi
	push rsi
	push rdx
	mov rax, 1
	push rbx ;callee saved
	syscall

	;not checking for error during syscall
	;because write does it by itself already.

	;epilogue
	pop rbx
	pop rdx
	pop rsi
	pop rdi
	mov rsp, rbp
	pop rbp
	ret