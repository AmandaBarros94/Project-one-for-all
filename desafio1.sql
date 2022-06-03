DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans(
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(255) NOT NULL,
    plan_value DECIMAL(5,2) NOT NULL
);

CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_age SMALLINT UNSIGNED NOT NULL,
    plan_id INT NOT NULL,
	FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

CREATE TABLE artists(
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
);
CREATE TABLE albuns(
    collection_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    release_year YEAR,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)    
);
CREATE TABLE musics(
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    music_name VARCHAR(255) NOT NULL,
    collection_id INT NOT NULL,
    seconds_amount INT UNSIGNED NOT NULL,
	FOREIGN KEY (collection_id) REFERENCES albuns(collection_id)
);

CREATE TABLE following_artist(
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(artist_id, user_id),
	FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE history_music(
    history_id INT NOT NULL,
    user_id INT NOT NULL,
    date_listenned DATETIME NOT NULL,
	  FOREIGN KEY (history_id) REFERENCES musics(history_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT PRIMARY KEY(history_id, user_id) 
);

CREATE TABLE user_plan(
    plan_id INT NOT NULL,
    user_id INT NOT NULL,
    date_user_plan DATETIME NOT NULL,
	  FOREIGN KEY (plan_id) REFERENCES plans(plan_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT PRIMARY KEY(plan_id, user_id)
);


INSERT INTO plans (plan_name, plan_value) VALUES ('gratuito', 0);
INSERT INTO plans (plan_name, plan_value) VALUES ('familiar', 7.99);
INSERT INTO plans (plan_name, plan_value) VALUES ('universitário', 5.99);
INSERT INTO plans (plan_name, plan_value) VALUES ('pessoal', 6.99);


INSERT INTO users (user_name, user_age, plan_id) VALUES ("Thati", 23, 1);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Cintia', 35, 2);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Bill', 20, 3);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Roger', 45, 4);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Norman', 58, 4);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Patrick', 33, 2);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Vivian', 26, 3);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Carol', 19, 3);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Angelina', 42, 2);
INSERT INTO users (user_name, user_age, plan_id) VALUES ('Paul', 46, 2);

INSERT INTO artists (artist_name) VALUES ('Walter Phoenix');
INSERT INTO artists (artist_name) VALUES ('Peter Strong');
INSERT INTO artists (artist_name) VALUES ('Lance Day');
INSERT INTO artists (artist_name) VALUES ('Freedie Shannon');
INSERT INTO artists (artist_name) VALUES ('Tyler Isle');
INSERT INTO artists (artist_name) VALUES ('Fog');



INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Envious', 1, 1990);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Exuberant', 1, 1993);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Hallowed Steam', 2, 1995);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Incandescent', 3, 1998);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Temporary Culture', 4, 2001);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Library of liberty', 4, 2003);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Chained Down', 5, 2007);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Cabinet of fools', 5, 2012);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('No guarantees', 5, 2015);
INSERT INTO albuns (album_name, artist_id, release_year) VALUES ('Apparatus', 6, 2015);


INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (1, 'Soul For Us', 1, 200);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (2, 'Reflections Of Magic', 1, 163);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (3, 'Dance With Her Own', 1, 116);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (4, 'Troubles Of My Inner Fire', 2, 203);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (5, 'Time Fireworks', 2, 152);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (6, 'Magic Circus', 3, 105);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (7, 'Honey, So Do I', 3, 207);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (8, "Sweetie, Let's Go Wild", 3, 139);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (9, 'She Knows', 3, 244);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (10, 'Fantasy For Me', 4, 100);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (11, 'Celebration Of More', 4, 146);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (12, 'Rock His Everything', 4, 223);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (13, 'Home Forever', 4, 231);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (14, 'Diamond Power', 4, 241);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (15, "Let's Be Silly", 4, 132);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (16, 'Thang Of Thunder', 5, 240);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (17, 'Words Of Her Life', 5, 185);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (18, 'Without My Streets', 5, 176);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (19, 'Need Of The Evening', 6, 190);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (20, 'History Of My Roses', 6, 222);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (21, 'Without My Love', 6, 111);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (22, 'Walking And Game', 6, 123);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (23, 'Young And Father', 6, 197);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (24, 'Finding My Traditions"', 7, 179);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (25, 'Walking And Man', 7, 229);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (26, 'Hard And Time', 7, 135);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (27, "Honey, I'm A Lone Wolf", 7, 150);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (28, "She Thinks I Won't Stay Tonight", 8, 166);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (29, "He Heard You're Bad For Me", 8, 154);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (30, "He Hopes We Can't Stay", 8, 210);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (31, 'I Know I Know', 8, 117);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (32, "He's Walking Away", 9, 159);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (33, "He's Trouble", 9, 138);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (34, 'I Heard I Want To Bo Alone', 9, 120);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (35, 'I Ride Alone', 9, 151);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (36, 'Honey', 10, 79);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (37, 'You Cheated On Me', 10, 95);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (38, "Wouldn't It Be Nice", 10, 213);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (39, 'Baby', 10, 136);
INSERT INTO musics (history_id, music_name, collection_id, seconds_amount) VALUES (40, 'You Make Me Feel So..', 10, 83);


INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (36, 1, '2020-02-28 10:45:55');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (25, 1, '2020-05-02 05:30:35');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (23, 1, '2020-03-06 11:22:33');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (14, 1, '2020-08-05 08:05:17');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (15, 1, '2020-09-14 16:32:22');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (34, 2, '2020-01-02 07:40:33');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (24, 2, '2020-05-16 06:16:22');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (21, 2, '2020-10-09 12:27:48');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (39, 2, '2020-09-21 13:14:46');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (6, 3, '2020-11-13 16:55:13');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (3, 3, '2020-12-05 18:38:30');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (26, 3, '2020-07-30 10:00:00');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (2, 4, '2021-08-15 17:10:10');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (35, 4, '2021-07-10 15:20:30');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (27, 4, '2021-01-09 01:44:33');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (7, 5, '2020-07-03 19:33:28');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (12, 5, '2017-02-24 21:14:22');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (14, 5, '2020-08-06 15:23:43');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (1, 5, '2020-11-10 13:52:27');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (38, 6, '2019-02-07 20:33:48');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (29, 6, '2017-01-24 00:31:17');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (30, 6, '2017-10-12 12:35:20');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (22, 6, '2018-05-29 14:56:41');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (5, 7, '2018-05-09 22:30:49');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (4, 7, '2020-07-27 12:52:58');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (11, 7, '2018-01-16 18:40:43');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (39, 8, '2018-03-21 16:56:40');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (40, 8, '2020-10-18 13:38:05');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (32, 8, '2019-05-25 08:14:03');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (33, 8, '2021-08-15 21:37:09');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (16, 9, '2021-05-24 17:23:45');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (17, 9, '2018-12-07 22:48:52');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (8, 9, '2021-03-14 06:14:26');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (9, 9, '2020-04-01 03:36:00');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (20, 10, '2017-02-06 08:21:34');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (21, 10, '2017-12-04 05:33:43');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (12, 10, '2017-07-27 05:24:49');
INSERT INTO history_music (history_id, user_id, date_listenned) VALUES (13, 10, '2017-12-25 01:03:57');


INSERT INTO following_artist (artist_id, user_id) VALUES (1, 1);
INSERT INTO following_artist (artist_id, user_id) VALUES (4, 1);
INSERT INTO following_artist (artist_id, user_id) VALUES (3, 1);
INSERT INTO following_artist (artist_id, user_id) VALUES (1, 2);
INSERT INTO following_artist (artist_id, user_id) VALUES (3, 2);
INSERT INTO following_artist (artist_id, user_id) VALUES (2, 3);
INSERT INTO following_artist (artist_id, user_id) VALUES (1, 3);
INSERT INTO following_artist (artist_id, user_id) VALUES (4, 4);
INSERT INTO following_artist (artist_id, user_id) VALUES (5, 5);
INSERT INTO following_artist (artist_id, user_id) VALUES (6, 5);
INSERT INTO following_artist (artist_id, user_id) VALUES (6, 6);
INSERT INTO following_artist (artist_id, user_id) VALUES (3, 6);
INSERT INTO following_artist (artist_id, user_id) VALUES (1, 6);
INSERT INTO following_artist (artist_id, user_id) VALUES (2, 7);
INSERT INTO following_artist (artist_id, user_id) VALUES (5, 7);
INSERT INTO following_artist (artist_id, user_id) VALUES (1, 8);
INSERT INTO following_artist (artist_id, user_id) VALUES (5, 8);
INSERT INTO following_artist (artist_id, user_id) VALUES (6, 9);
INSERT INTO following_artist (artist_id, user_id) VALUES (4, 9);
INSERT INTO following_artist (artist_id, user_id) VALUES (3, 9);
INSERT INTO following_artist (artist_id, user_id) VALUES (2, 10);
INSERT INTO following_artist (artist_id, user_id) VALUES (6, 10);


INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (1, 1, '2019-10-20');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (2, 2, '2017-12-30');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (3, 3, '2019-06-05');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (4, 4, '2020-05-13');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (5, 4, '2017-02-17');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (6, 2, '2017-01-06');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (7, 3, '2018-01-05');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (8, 3, '2018-02-14');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (9, 2, '2018-04-29');
INSERT INTO user_plan (user_id, plan_id, date_user_plan) VALUES (10, 2, '2017-01-17');
