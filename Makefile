# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alerandy <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/17 14:01:58 by alerandy          #+#    #+#              #
#    Updated: 2017/11/22 13:58:20 by acourtin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit
CFLAG = -Wall -Werror -Wextra
CC = gcc $(CFLAG)
SRC = ft_fillit.c ft_tetridetector.c ft_tetrifile.c ft_map.c \
	  ft_checkerror.c

OBJ = $(SRC:.c=.o)

all : $(NAME)

$(NAME) : submake $(OBJ)
	@$(CC) $(OBJ) -Ilibft/ -Llibft -lft -o $(NAME)
	@printf "\r\033[K"
	@echo "\033[32m/------------------------------------\ \\033[0m"
	@echo "\033[32m|----------- $(NAME) créé ------------| \\033[0m"
	@echo "\033[32m\------------------------------------/ \\033[0m"

cpp : submake
	@cpp $(CFLAG) $(SRC) -Ilibft/ -Llibft -lft -o $(NAME)

submake :
	@$(MAKE) -C libft/

%.o: %.c
	@printf "\r\033[K""\033[36m - Compilation de \033[0m$<\033[0m"
	@$(CC) -o $@ -c $< -Ilibft

clean :
	@$(MAKE) fclean -C libft/
	@rm -f $(OBJ)

fclean : clean
	@rm -f $(NAME)
	@echo "\033[31mSuppression - $(NAME)\033[0m"

re : fclean all
