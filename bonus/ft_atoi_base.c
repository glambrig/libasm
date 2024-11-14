#include <stdlib.h>
#include <stdio.h>

int base_checks(char *base)
{
	int i = 0;

	while (base && base[i])
	{
		if (base[i] == '+' || base[i] == '-' || base[i] == ' ')
			return (-1);
		i++;
	}
	if (i < 2)
		return (-1);
	return (0);
}

unsigned int base_len(char *base)
{
	int i = 0;
	while (base && base[i])
		i++;
	return (i);
}

int convert_to_b10(char c, char *base)
{
	for (int k = 0; base[k]; k++)
	{
		if (base[k] == c)
			return (k);
	}
	return (0);
}

int	ft_atoi_base(char *s, char *base)
{
	int i = 0;
	int sign = 1;
	int res = 0;
	int b_len = base_len(base);

	if (base_checks(base) < 0)
		return (0);
	while (s[i] && s[i] == ' ') //doesn't include other whitespace like \t but ok for now
		i++;
	while (s[i] && (s[i] == '+' || s[i] == '-'))
	{
		if (s[i] == '-')
			sign = -sign;
		i++;
	}
	while (s[i] && s[i] >= base[0] && s[i] <= base[b_len - 1])
	{
		int len = i;
		while (s[len])
			len++;
		res *= b_len;
		res += convert_to_b10(s[i], base);
		i++;
	}
	return (res * sign);
}