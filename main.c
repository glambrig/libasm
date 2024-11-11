#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

extern size_t ft_strlen(const char *str);
extern char *ft_strcpy(const char *dest, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fd, void *buf, size_t count);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern char *ft_strdup(const char *s);

/*strlen*/
// int main(void) {
//     const char *str1 = "Hello, world!";
//     const char *str2 = NULL;
//     size_t length;

// 	length = ft_strlen(str1);
//     printf("The length of str1 is: %zu\n", length);
// 	length = ft_strlen(str2);
//     printf("The length of str2 is: %zu\n", length);
//     return 0;
// }

/*strcpy*/
// int main(void)
// {
// 	const char *src = "hello";
// 	const char *dest = "aaaaa";

// 	printf("dest = \"%s\"\nsrc = \"%s\"\n", dest, src);

// 	dest = ft_strcpy(dest, src);
// 	printf("dest = \"%s\"\nsrc = \"%s\"\n", dest, src);
//     return 0;
// }


/*strcmp*/
// int main(void)
// {
// 	const char *s1 = "hell";
// 	const char *s2 = "helloooo";

// 	printf("s1 = \"%s\"\ns2 = \"%s\"\n", s1, s2);
// 	int res = ft_strcmp(s1, s2);
// 	if (res == 0)
// 		printf("Both strings are equal!\n");
// 	else if (res < 0)
// 		printf("s1 is less than s2\n");
// 	else
// 		printf("s1 is greater than s2\n");

// 	res = strcmp(s1, s2);
// 	if (res == 0)
// 		printf("Both strings are equal!\n");
// 	else if (res < 0)
// 		printf("s1 is less than s2\n");
// 	else
// 		printf("s1 is greater than s2\n");
// }

/*write*/
// int main(void)
// {
// 	int res = ft_write(1, "hello world!\n", 14);
// 	printf("Length of written string is: %d\n", res);
// 	return (0);
// }

/*read*/
// void delete_testfile(void)
// {
// 	int fd = fork();
// 	if (fd == 0)
// 	{
// 		char *argv[] = {"/bin/rm", "-rf", "./testfile", NULL};
// 		execve("/bin/rm", argv, __environ);
// 		exit(1);
// 	}
// 	wait(NULL);
// }

// int main(void)
// {
// 	char buff[42];
// 	int openfd;

// 	openfd = open("./testfile", O_RDWR | O_CREAT);
// 	if (openfd < 0)
// 		return (1);
// 	if (write(openfd, "hello wooorld!!! :)", 20) < 0)
// 		return (close(openfd), 1);

// 	printf("Opened/created file!\n");
// 	lseek(openfd, 0, SEEK_SET);
// 	for (int i = 0; i < 33; i++)
// 	{
// 		int bytes_read = ft_read(openfd, buff, 3);
// 		if (bytes_read <= 0)
// 		{
// 			write(STDERR_FILENO, "Failed to read from file!\n", 27);
// 			close(openfd);
// 			delete_testfile();
// 			return (1);
// 		}
// 		buff[bytes_read] = '\0';
// 		printf("buff : %s\n", buff);
// 	}
// 	close(openfd);
// 	return (0);
// }

/*strdup*/
int main(void)
{
	char *s1 = "this string will be duuuuuplicated...";
	char *s2 = NULL;

	printf("s1 = %s\n", s1);

	s2 = ft_strdup(s1);
	if (!s2)
	{
		perror("ft_strdup failed with code: ");
		return (1);
	}
	printf("s2 = %s\n", s2);
	printf("Address of s1 is: %p\nAddress of s2 is: %p\n", &s1, &s2);
	free(s2);
	return (0);
}

/*
;char *strcpy(char *dest, const char *src);
ft_strcpy:
	;prologue
	push rbp
	mov rbp, rsp
	push rdi ;dest
	push rsi ;src

	;function body
	
	;call strlen on src and dest
	call ft_strlen	;call strlen on dest
	mov rcx, rax ;store result of strlen(dest) in rcx
	push rdi
	mov rdi, rsi
	call ft_strlen	;call strlen on src
	mov rdx, rdi ;store result of strlen(src) in rdx
	pop rdi

	;check if dest is large enough to accomodate src
	inc rdx ;since we copy src's \0 too, there has to be space for strlen(src) + 1
	cmp rdx, rcx
	jg .error ;if strlen(src) > strlen(dest), error

	;check if strings overlap in memory
	;if src - dest < strlen(src), then mem overlaps, error
	mov rcx, rsi
	sub rcx, rdi
	cmp rcx, rdx ;rdx==strlen(src)
	jl .error

	xor rcx, rcx
;iterate through src, copy into dest
.loop:
	cmp byte [rsi + rcx], 0
	je .copy_null_return
	mov rdx, [rsi + rcx] ;using rdx as the char buffer, not strlen(dest) anymore
	mov [rdi + rcx], rdx
	inc rcx
	jmp .loop

;returns dest, not null
.error:
	mov rax, rdi
	jmp .epilogue

;copies the null terminator into dest and returns
.copy_null_return:
	mov byte [rdi + rcx], 0
	jmp .epilogue

.epilogue:
	pop rsi
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
*/