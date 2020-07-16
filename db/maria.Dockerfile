FROM mariadb:latest

ENV MYSQL_USER=tester \
    MYSQL_PASSWORD=testing \
    MYSQL_DATABASE=phoos-db \
    MYSQL_ROOT_PASSWORD=testing \
    MYSQL_ROOT_HOST=%
    
COPY my.cnf /etc/mysql/
COPY test/1.phoosball.sql /
COPY test/2.initial_data.sql /
COPY test/3.views.sql /
COPY test/4.edits.sql /
COPY ./run.sh /docker-entrypoint-initdb.d/