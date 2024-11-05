#include <stdio.h>

// extern size_t ft_strlen(const char *str);
extern char *ft_strcpy(const char *dest, const char *src);

/*strlen*/
// int main() {
//     // const char *test_str = "Hello, world!";
//     const char *test_str = NULL;
//     size_t length = ft_strlen(test_str);
//     printf("The length of the string is: %zu\n", length);
//     return 0;
// }

/*strcpy*/
int main()
{
	const char *src = "hello";
	const char *dest = "aaaaa";

	printf("dest = \"%s\"\nsrc = \"%s\"\n", dest, src);

	dest = ft_strcpy(dest, src);
	printf("dest = \"%s\"\nsrc = \"%s\"\n", dest, src);
    return 0;
}