TRUNCATE users CASCADE;
TRUNCATE episodes CASCADE;
TRUNCATE shows CASCADE;
TRUNCATE user_follow_show CASCADE;
TRUNCATE user_rate_show CASCADE;
TRUNCATE user_watch_episode CASCADE;

ALTER TABLE "user_follow_show" DISABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" DISABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" DISABLE TRIGGER ALL;
ALTER TABLE "episodes" DISABLE TRIGGER ALL;

COPY users(user_id,registration_date,firstname,lastname,email,password)
FROM '/home/Ulric/csv/user.csv' DELIMITER ',' CSV HEADER;
COPY episodes(episode_id,show_id,season,number,date)
FROM '/home/Ulric/csv/episode.csv' DELIMITER ',' CSV HEADER;
COPY shows(show_id,name,description,release_year,genres,network)
FROM '/home/Ulric/csv/show.csv' DELIMITER ',' CSV HEADER;
COPY user_watch_episode(user_id,episode_id,watch_date)
FROM '/home/Ulric/csv/user_watch_episode.csv' DELIMITER ',' CSV HEADER;
COPY user_follow_show(user_id,show_id,follow_date)
FROM '/home/Ulric/csv/user_follow_show.csv' DELIMITER ',' CSV HEADER;
COPY user_rate_show(user_id,show_id,rating,rating_date)
FROM '/home/Ulric/csv/user_rate_show.csv' DELIMITER ',' CSV HEADER;



SELECT * from users LIMIT 1;
SELECT * from episodes LIMIT 1;
SELECT * from shows LIMIT 1;
SELECT * from user_watch_episode LIMIT 1;
SELECT * from user_follow_show LIMIT 1;
SELECT * from user_rate_show LIMIT 1;



ALTER TABLE "user_follow_show" ENABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" ENABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" ENABLE TRIGGER ALL;
ALTER TABLE "episodes" DISABLE TRIGGER ALL;
