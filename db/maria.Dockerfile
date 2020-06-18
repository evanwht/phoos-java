FROM mariadb:latest

ENV MYSQL_USER=tester \
    MYSQL_PASSWORD=testing \
    MYSQL_DATABASE=phoos-db \
    MYSQL_ROOT_PASSWORD=testing \
    MYSQL_ROOT_HOST=%
    
HEALTHCHECK --interval=10s --timeout=10s --start-period=2s --retries=3 CMD [ "mysqladmin", "ping", "-h", "127.0.0.1" ]

COPY my.cnf /etc/mysql/    
