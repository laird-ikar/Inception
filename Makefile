NAME	=	inceptions

all: $(NAME)

$(NAME):
	sudo mkdir -p ~/Desktop/inception
	sudo chmod 777 ~/Desktop/inception
	docker-compose -f srcs/docker-compose.yml up -d --build

test:
	docker-compose -f srcs/docker-compose.yml up --build

clean:
	sudo rm -rf ~/Desktop/inception
	docker-compose -f srcs/docker-compose.yml down --remove-orphans

fclean: clean
	docker system prune

re: clean all

.PHONY : all clean fclean re