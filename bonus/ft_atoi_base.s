global ft_atoi_base

section .data
i dq 0
sign db 1
res dq 0
base_len dw ?

;int ft_atoi_base(char *s, char *base)
section .text
ft_atoi_base:
	