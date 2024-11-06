#include <stdio.h>
#include <sys/types.h>

// extern size_t ft_strlen(const char *str);
// extern char *ft_strcpy(const char *dest, const char *src);
// extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fd, void *buf, int count);

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

int main(void)
{
	int res = ft_write(1, "hello world!\n", 14);
	// printf("res: %d\n", res);
	return (0);
}