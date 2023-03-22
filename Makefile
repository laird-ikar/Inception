NAME	=	inceptions

all: $(NAME)

$(NAME):
	docker compose -f srcs/docker-compose.yml up -d --build --no-cache

test:
	docker compose -f srcs/docker-compose.yml up --build

clean:
	docker compose -f srcs/docker-compose.yml down --remove-orphans

fclean: clean
	docker system prune

re: clean all

.PHONY : all clean fclean re