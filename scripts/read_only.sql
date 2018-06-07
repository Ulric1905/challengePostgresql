
DROP OWNED BY Read_Only_User;


REVOKE ALL PRIVILEGES ON SCHEMA public FROM Read_Only_User;


REVOKE ALL ON ALL TABLES IN SCHEMA public FROM Read_Only_User;

-- supprime le droit connect à la db
REVOKE CONNECT ON DATABASE shows FROM Read_Only_User;


-- supprime les roles
REVOKE Read_Only_User FROM Read_User;
DROP ROLE Read_User;
DROP ROLE Read_Only_User;




CREATE ROLE Read_Only_User;
CREATE ROLE Read_User LOGIN PASSWORD 'azerty';
GRANT Read_Only_User to Read_User;

GRANT CONNECT ON DATABASE shows TO Read_Only_User;
GRANT USAGE ON SCHEMA public TO Read_Only_User;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO Read_Only_User;
