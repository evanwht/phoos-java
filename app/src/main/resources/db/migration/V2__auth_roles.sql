ALTER TABLE players ADD COLUMN salt varchar(4);
ALTER TABLE players ADD COLUMN password varchar(256);
ALTER TABLE players ADD COLUMN role varchar(32);