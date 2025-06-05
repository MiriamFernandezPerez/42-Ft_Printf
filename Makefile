NAME =		libftprintf.a

CC =		gcc

CFLAGS =	-Wall -Wextra -Werror

RM =		rm -f

LIB =		ar rc

HEADER =	ft_printf.h

SRCS =		ft_printf.c ft_putchar.c ft_putstr.c ft_putnbr.c ft_putunsig.c ft_putptr.c ft_puthex.c 

OBJS =		$(SRCS:.c=.o)

%.o:%.c		$(HEADER) Makefile
			$(CC) $(CFLAGS) -c $< -o $@

all:		$(NAME)

$(NAME):	$(OBJS)
			$(LIB) $(NAME) $(OBJS)

clean:
			$(RM) $(OBJS)

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY: 	all clean fclean re
