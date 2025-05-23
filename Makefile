.PHONY: all name re clean fclean bonus

NAME = libasm.a

SRC = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

OBJ = $(SRC:.s=.o)

#CHANGE THIS
BONUSSRC = ./bonus/*.s

BONUSOBJ = $(BONUSSRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar -rcs $(NAME) $^

%.o: %.s
	nasm $< -f elf64 -o $@ -g

clean:
	rm -rf *.o
	rm -rf ./bonus/*.o

fclean: clean
	rm -rf $(NAME)
	rm -rf ./a.out
	rm -rf ./bonus/a.out

re: fclean all