NAME = libasm.a

SRCS = ft_strlen.s

FLAGS = -f win64
OBJS = $(SRCS:.s=.obj)

all: $(NAME)

$(NAME) :	$(OBJS)
			ar rc $(NAME) $(OBJS)
			ranlib $(NAME)

%.obj: 	%.s 
		nasm $(FLAGS) $<

clean: 
		rm -rf $(OBJS)

fclean: clean
		rm -rf $(NAME)

re: fclean all