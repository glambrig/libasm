.PHONY: all name re clean fclean bonus

NAME = libasm

SRC = ./*.s

OBJ = $(SRC:.c=.o)

BONUSSRC = ./bonus/*.s

BONUSOBJ = ./bonus/*.o

all: $(NAME)

$(NAME): $(OBJ)
	ar -rcs $(NAME) $^

$(OBJ): $(SRC)
	nasm -f elf64 $^ -o $@

clean:
	rm -rf *.o
	rm -rf ./bonus/*.o

fclean: clean
	rm -rf $(NAME)