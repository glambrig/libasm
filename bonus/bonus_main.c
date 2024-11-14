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

typedef struct s_list
{
	void	*data;
	struct s_list *next;
}	t_list;

extern int ft_atoi_base(char *s, char *base);
extern int ft_list_size(t_list *lst);

/*ft_lstsize*/
int main(void)
{
	int num = 123;
	t_list c = {&num, NULL};
	t_list b = {&num, &c};
	t_list a = {&num, &b};

	int len = ft_list_size(&a);
	printf("lstlen = %d\n", len);
	return (0);
}

/*ft_list_push_front*/
// int main(void)
// {
// 	t_list *list = NULL;
// 	int data1 = 42;
// 	int data2 = 84;

// 	ft_list_push_front(&list, &data1);
// 	ft_list_push_front(&list, &data2);

// 	printf("First element: %d\n", *(int *)(list->data));
// 	printf("Second element: %d\n", *(int *)(list->next->data));

// 	return 0;
// }

/*atoi_base*/
// int main(void)
// {
// 	printf("size=%ld\n", sizeof(struct s_list*));
// 	// printf("123₁₀ from 7b₁₆: %d\n", ft_atoi_base("7b", "0123456789abcdef"));
// 	// printf("29₁₀ from 0011101₂: %d\n", ft_atoi_base("0011101", "01"));
// 	// printf("88888₁₀ from 10321023₅: %d\n", ft_atoi_base("10321023", "01234"));
// 	// printf("-123₁₀ from -7b₁₆: %d\n", ft_atoi_base("-7b", "0123456789abcdef"));
// 	return (0);
// }