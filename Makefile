NAME	=	inceptions

all: $(NAME)

$(NAME):
	docker-compose -f srcs/docker-compose.yml up --build

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean: clean
	printf "y\n" | docker system prune -a

re: fclean all

.PHONY : all clean fclean re