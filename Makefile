DOCKER_COMPOSE_FILE		= srcs/docker-compose.yml
DATABASE_VOLUME			= /var/lib/mysql
WORDPRESS_VOLUME		= /var/www/html
DATABASE_DOCKER_VOLUME	= srcs_db
WORDPRESS_DOCKER_VOLUME	= srcs_wordpress

MKDIR					= mkdir -p
RM						= rm -rf

all:	up

up:
		sudo $(MKDIR) $(DATABASE_VOLUME)
		sudo $(MKDIR) $(WORDPRESS_VOLUME)
		docker-compose -f $(DOCKER_COMPOSE_FILE) up --build -d

down:
		docker-compose -f $(DOCKER_COMPOSE_FILE) down

stop:
		docker-compose -f $(DOCKER_COMPOSE_FILE) stop

logs:
		docker-compose -f $(DOCKER_COMPOSE_FILE) logs

clean:		down
		docker container prune --force

fclean:		clean
		sudo $(RM) $(DATABASE_VOLUME)
		sudo $(RM) $(WORDPRESS_VOLUME)
		docker system prune --all --force
		docker volume rm $(DATABASE_DOCKER_VOLUME) $(WORDPRESS_DOCKER_VOLUME)

re:			fclean all

.PHONY:		all volume up down clean fclean re