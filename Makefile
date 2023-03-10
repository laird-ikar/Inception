NAME	=	inceptions

all: $(NAME)

$(NAME):
	docker-compose up -d --build --project-directory srcs

clean:
	docker-compose down --project-directory srcs

fclean: clean
	printf "y\n" | docker system prune -a

re: fclean all

.PHONY : all clean fclean re