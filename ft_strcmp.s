section .text
global ft_strcmp

ft_strcmp:
	;prologue
	push rbp
	mov rbp, rsp

	;not checking for null, as libc version doesn't either

	xor rcx, rcx
.loop:
	;the zero-extension is necessary here, otherwise everything in rax/rdx
	;will keep old values in the other 63 bytes
	;(since we're only moving a single byte)
	movzx rax, byte [rsi + rcx]
	movzx rdx, byte [rdi + rcx]
	cmp rax, rdx
	jne .finish
	test rdx, rdx
	jz .finish
	inc rcx
	jmp .loop
	
.finish:
	sub rdx, rax
	mov rax, rdx

.epilogue:
	mov rsp, rbp
	pop rbp
	ret
