DROP DATABASES IF EXISTS vk;
CREATE DATABASE vk;
USE vk;


-- Таблица пользователь
DROP TABLE IF EXISTS vk.users
CREATE TABLE users(
    'id' INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'firstname' VARCHAR(15) NOT NULL,
    'lastname' VARCHAR(15) NOT NULL,
    'login' VARCHAR(20) UNIQUE NOT NULL,
    'password_' VARCHAR(20) NOT NULL,
    'phone_number' VARCHAR(15) NOT NULL UNIQUE,
    'tag' VARCHAR(20),
    
    PRIMARY KEY (id)
);
-- Заполняем таблицу пользователь

INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('dasha', 'Lo', 'LOdash', '12345', '12345678')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('sasha', 'Low', 'LOwash', '12345', '12345671')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('kasha', 'Loc', 'LOcash', '12345', '12345672')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('masha', 'Lov', 'LOvash', '12345', '12345673')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('pasha', 'Lob', 'LObash', '12345', '12345674')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('vasha', 'Lon', 'LOnash', '12345', '12345675')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('lasha', 'Lom', 'LOmash', '12345', '12345676')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('washa', 'Lok', 'LOwash', '12345', '12345677')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('casha', 'Loh', 'LOhash', '12345', '12345679')
INSERT INTO vk.users
(firstname, lastname, login, password_, phone_number)
VALUES ('zasha', 'Log', 'LOgash', '12345', '12345670')

-- Создаем таблицу профиль привязанную к пользователю

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	'user_id' INT UNSIGNED NOT NULL UNIQUE,
    'gender' CHAR(1),
    'birthday' DATE,
    'created_at' DATETIME DEFAULT NOW(),
    'hometown' VARCHAR(100),
    'tag' VARCHAR(20),
    
    FOREIGN KEY (user_id) REFERENCES vk.users(id)

);

-- Заполняем профиль

INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('1','W','2001-03-21','Almaty')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('2','M','2000-03-08','Moscow')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('3','M','2000-03-06','Astana')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('4','W','2001-04-13','Moscow')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('5','W','2001-05-22','Almaty')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('6','W','2001-02-25','Almaty')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('7','M','2001-01-01','Astana')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('8','W','2001-08-12','Astana')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('9','M','2001-07-20','Berlin')
INSERT INTO vk.profiles
(user_id, gender, birthday, hometown)
VALUES('10','M','2001-12-11','Aktobe')


-- Создаем таблицу группы 

DROP TABLE IF EXISTS vk.groups_for_users
CREATE TABLE groups_for_users(
    'id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'namegroup' VARCHAR(15) NOT NULL,
    'id_admin_user' INT NOT NULL,
    'tag' VARCHAR(20),

    FOREIGN KEY (id_admin_user) REFERENCES vk.users(id)
);