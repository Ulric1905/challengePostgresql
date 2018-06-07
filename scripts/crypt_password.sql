CREATE EXTENSION pgcrypto;

UPDATE users 
SET password = crypt(password, gen_salt('bf'));
SELECT * from users LIMIT 1;


SELECT * FROM users WHERE password = crypt('adaliquid667', password);
