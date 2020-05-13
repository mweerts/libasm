NAME = libasm.a

SRCS =	srcs/ft_strlen.s \
		srcs/ft_strcpy.s \
		srcs/ft_strcmp.s \
		srcs/ft_write.s \
		srcs/ft_read.s

FLAGS = -f elf64 
OBJS = $(SRCS:.s=.o)

RED = \033[0;31m
BOLD_GREEN = \033[01;32m
GREEN = \033[0;32m
END = \033[0;0m

all: $(NAME)

$(NAME) :	$(OBJS)
			@echo "$(BOLD_GREEN)[libasm] $(GREEN)Making libasm.a$(END)"
			@ar rc $(NAME) $(OBJS)
			@ranlib $(NAME)

%.o: 	%.s 
		@echo "$(BOLD_GREEN)[libasm] $(GREEN)Compiling $@$(END)"
		@nasm $(FLAGS) $< -o $@

clean: 
		@echo "$(BOLD_GREEN)[libasm] $(RED)Cleaning objs$(END)"
		@rm -rf main.o
		@rm -rf $(OBJS)

fclean: 
		@echo "$(BOLD_GREEN)[libasm] $(RED)Cleaning all$(END)"
		@rm -rf $(OBJS)
		@rm -rf main.o a.out
		@rm -rf $(NAME)

re: fclean all

run:	all
		clang main.c libasm.a 
		./a.out all