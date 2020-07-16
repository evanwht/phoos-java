#!/bin/bash
sleep 5
mysql -uroot -ptesting <<< "create database phoosball;"
mysql -uroot -ptesting <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by 'testing';"
mysql -uroot -ptesting mysql < /1.phoosball.sql
mysql -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (1, 'phoosball', '1.phoosball.sql', '6bba020d7cdd9386c3c1d59d68d5de78');"
mysql -uroot -ptesting mysql < /2.initial_data.sql
mysql -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (2, 'initial_data', '2.initial_data.sql', '988ad8bedfbfd5b695cda50b342e62d2');"
mysql -uroot -ptesting mysql < /3.views.sql
mysql -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (3, 'views', '3.views.sql', 'cebbc6becd4421951b4c6b3c184d7956');"
mysql -uroot -ptesting mysql < /4.edits.sql
mysql -uroot -ptesting <<< "INSERT INTO phoosball.schema_history (version, description, name, checksum) VALUES (4, 'edits', '4.edits.sql', '8b8953f3b1bd199655cd38c90033f66f');"