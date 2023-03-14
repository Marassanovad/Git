USE vk;


-- Задание 1
-- Подсчитать количество групп, в которые вступил каждый пользователь.

SELECT firstname , lastname, COUNT(*) 
FROM users 
JOIN users_communities uc on users.id = uc.user_id
GROUP BY users.id
ORDER BY COUNT(*) DESC; 

-- Задание 2
-- Подсчитать количество пользователей в каждом сообществе.

SELECT COUNT(*), communities.name 
FROM users_communities 
JOIN communities on users_communities.community_id  = communities.id 
GROUP BY communities.id;



-- Задание 3
-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT CONCAT(users.firstname, ' ', users.lastname) as name, COUNT(*) as messegecount 
FROM messages 
JOIN users on users.id = messages.from_user_id 
WHERE messages.to_user_id = 1
GROUP BY messages.from_user_id 
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- Задание 4
-- * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..

SELECT COUNT(*) as likes
FROM likes 
WHERE media_id IN (
      SELECT id
      FROM media 
      WHERE user_id IN (
            SELECT user_id
            FROM profiles
            WHERE YEAR(CURDATE()) - YEAR(profiles.birthday) < 18
     )
);


-- Задание 5
-- * Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT gender FROM (
       SELECT gender, COUNT((SELECT COUNT(*) FROM likes WHERE likes.user_id = profiles.user_id)) as likes_count FROM profiles
       WHERE gender = 'm'
       GROUP BY gender 
       UNION ALL 
       SELECT gender, COUNT((SELECT COUNT(*) FROM likes WHERE likes.user_id = profiles.user_id)) as likes_count FROM profiles
       WHERE gender = 'f'
       GROUP BY gender 
) AS 
GROUP BY gender 
ORDER BY MAX(likes_count) DESC 
LIMIT 1;