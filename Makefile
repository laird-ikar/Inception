NAME	=	inceptions

all: $(NAME)

$(NAME):
	docker-compose up -d --build -f srcs/docker-compose.yml

clean:
	docker-compose down --project-directory srcs

fclean: clean
	printf "y\n" | docker system prune -a

re: fclean all

.PHONY : all clean fclean re