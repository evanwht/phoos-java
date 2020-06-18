#!/bin/bash

docker-compose -f stack.yml up -d

while [[ "$(docker inspect --format '{{json .State.Health.Status }}' phoos-db)" != "\"healthy\"" ]]; do
    echo -n "."
    sleep 1
done

printf "\ncreating database\n"
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting <<< "create database phoosball;"
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by 'testing';"
printf "applying 1.phoosball.sql\n"
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting mysql < test/1.phoosball.sql
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (1, 'phoosball', '1.phoosball.sql', '6bba020d7cdd9386c3c1d59d68d5de78');"
printf "applying 2.initial_data.sql\n"
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting mysql < test/2.initial_data.sql
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (2, 'initial_data', '2.initial_data.sql', '988ad8bedfbfd5b695cda50b342e62d2');"
printf "applying 3.views.sql\n"
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting mysql < test/3.views.sql
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (3, 'views', '3.views.sql', 'cebbc6becd4421951b4c6b3c184d7956');"
printf "applying 4.edit.sql\n"
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting mysql < test/4.edits.sql
docker exec -i phoos-db mysql -h127.0.0.1 -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (4, 'edits', '4.edits.sql', '8b8953f3b1bd199655cd38c90033f66f');"