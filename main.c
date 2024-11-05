#include <stdio.h>

extern size_t ft_strlen(const char *str);

int main() {
    // const char *test_str = "Hello, world!";
    const char *test_str = NULL;
    size_t length = ft_strlen(test_str);
    printf("The length of the string is: %zu\n", length);
    return 0;
}
