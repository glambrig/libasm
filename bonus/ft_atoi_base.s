%define ASCII_PLUS 43
%define ASCII_MINUS 45
%define ASCII_SPACE 32
%define ASCII_TAB 9

section .data
i dq 0
sign db 1
res dq 0

section .bss
b_len resw 1

;int ft_atoi_base(char *s, char *base)
section .text
global ft_atoi_base
;;;;;;;;;;;;
base_checks:
	push rbp
	mov rbp, rsp

	mov rdx, -1
	cmp rsi, 0
	cmove rax, rdx
	je .return
	xor rcx, rcx
.loop:
	cmp byte [rsi + rcx], 0
	je .check_il2

	cmp byte [rsi + rcx], ASCII_PLUS
	cmove rax, rdx
	je .return
	cmp byte [rsi + rcx], ASCII_MINUS
	cmove rax, rdx
	je .return
	cmp byte [rsi + rcx], ASCII_SPACE
	cmove rax, rdx
	je .return

	inc rcx
	jmp .loop
.check_il2:	;check if rcx < 2
	cmp byte [rsi], 2
	cmovl rax, rdx
	je .return
	mov rax, 0
.return:
	mov rsp, rbp
	pop rbp
	ret

;;;;;;;;;;;;;
base_len:
	push rbp
	mov rbp, rsp

	xor rax, rax
	cmp rsi, 0
	je .return
.loop:
	cmp byte [rsi + rax], 0
	je .return
	inc rax
	jmp .loop
.return:
	mov rsp, rbp
	pop rbp
	ret

;;;;;;;;;;;;;
convert_to_b10:
	push rbp
	mov rbp, rsp

	mov rcx, qword 0
.loop:
	cmp byte [rsi + rcx], 0
	je .return
	cmp [rsi + rcx], rdi
	je .char_found
	inc rcx
	jmp .loop
.return:
	mov rsp, rbp
	pop rbp
	ret
.char_found:
	mov rax, rdi
	jmp .return
;;;;;;;;;;;;;
ft_atoi_base:
	;prologue
	push rbp
	mov rbp, rsp

	;body
	;null checks
	test rdi, rdi
	jz .epilogue
	test rsi, rsi
	jz .epilogue

	call base_len
	lea r9, [rel b_len]
	mov [r9], ax
	; b_len equ rax

	call base_checks
	cmp rax, 0
	mov rdx, 0	;not redundant, returning 0 (rax)
	cmovl rax, rdx	;not redundant, returning 0 (rax)
	jl .epilogue
	lea r8, [rel i]
	mov r9, [r8]
	lea r10, [rel sign]
	mov r8, [r10]
;skips whitespace
.skip_whitespace_loop:
	cmp byte [rdi + r9], 0
	je .sign_loop
	cmp byte [rdi + r9], ASCII_SPACE
	jne .sign_loop
	; cmp byte [rdi + r9], ASCII_TAB	;get basic functionality first, then add \t checks
	; jne .sign_loop	;get basic functionality first, then add \t checks
	inc r9	;no idea if this works lmao, just trying to i++
	jmp .skip_whitespace_loop
;sets the sign variable accordingly
.sign_loop:
	cmp byte [rdi + r9], 0
	je .conversion_final_loop
	xor rdx, rdx	;set rdx to 0
	mov rax, 1
	mov rcx, [rdi + r9]
	cmp rcx, ASCII_PLUS
	cmove rdx, rax	;if ==, inc rdx
	cmp rcx, ASCII_MINUS
	je .flip_sign
	test rdx, rdx
	jz .conversion_final_loop	;if rdx hasn't been incremented, exit loop
	inc r9
	jmp .sign_loop
.flip_sign:
	mov r15, -1
	cmp r8, 1
	cmove r8, r15
	inc r9
	jmp .sign_loop
;performs conversion to b10, and atoi operation
.conversion_final_loop:
	;conditions
	cmp byte [rdi + r9], 0
	je .epilogue
	mov r10, [rsi]
	cmp [rdi + r9], r10
	jl .epilogue
	dec qword [rel b_len]
	mov rcx, [rel b_len]
	add rcx, [rsi]
	cmp [rdi + r9], rcx
	jg .epilogue

	;res *= b_len;
	lea r9, [rel res]
	mov rcx, [r9]
	lea rdx, [rel b_len]
	imul rcx, [rdx]
	mov [r9], rcx

	;res += convert_to_b10(s[i], base);
	;PUSH PARAMS FIRST!
	call convert_to_b10
	mov rdx, [r9]
	add rdx, rax
	mov [r9], rdx

	inc r9
	; inc qword [rel i]	;no idea if this works lmao, just trying to i++
	jmp .conversion_final_loop
.epilogue:
	; lea rdx, [rel res]
	; mov rcx, [rdx]
	imul rax, r9
	mov rsp, rbp
	pop rbp
	ret