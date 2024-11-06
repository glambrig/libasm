#include <stdio.h>
#include <sys/types.h>

// extern size_t ft_strlen(const char *str);
// extern char *ft_strcpy(const char *dest, const char *src);
// extern int ft_strcmp(const char *s1, const char *s2);
// extern ssize_t ft_write(int fd, void *buf, size_t count);
extern ssize_t ft_read(int fd, void *buf, size_t count);


/*strlen*/
// int main(void) {
//     // const char *test_str = "Hello, world!";
//     const char *test_str = NULL;
//     size_t length = ft_strlen(test_str);
//     printf("The length of the string is: %zu\n", length);
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
// #include <string.h>
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

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
/*read*/

void delete_testfile(void)
{
	int fd = fork();
	if (fd == 0)
	{
		char *argv[] = {"/bin/rm", "-rf", "./testfile", NULL};
		execve("/bin/rm", argv, __environ);
		exit(1);
	}
	wait(NULL);
}

int main(void)
{
	char buff[42];
	int openfd;

	openfd = open("./testfile", O_RDWR | O_CREAT);
	if (openfd < 0)
		return (1);
	if (write(openfd, "hello wooorld!!! :)", 20) < 0)
		return (close(openfd), 1);

	printf("Opened/created file!\n");
	lseek(openfd, 0, SEEK_SET);
	for (int i = 0; i < 33; i++)
	{
		int bytes_read = ft_read(openfd, buff, 3);
		if (bytes_read <= 0)
		{
			write(STDERR_FILENO, "Failed to read from file!\n", 27);
			close(openfd);
			delete_testfile();
			return (1);
		}
		buff[bytes_read] = '\0';
		printf("buff : %s\n", buff);
	}
	close(openfd);
	return (0);
}