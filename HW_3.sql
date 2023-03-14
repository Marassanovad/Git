USE vk;


-- Задание 1
SELECT firstname FROM users
ORDER BY firstname;


-- Задание 2
SELECT COUNT(*) as oldman FROM profiles
WHERE gender = 'm' and TIMESTAMPDIFF(YEAR, birthday, NOW()) > 35;


-- Задание 3
SELECT COUNT(*) as applications, status FROM friend_requests
GROUP BY status;


-- Задание 4
SELECT COUNT(*) as cnt FROM friend_requests 
GROUP BY initiator_user_id 
ORDER BY cnt DESC 
LIMIT 1;


-- Задание 5
SELECT name FROM communities 
WHERE name LIKE '_____';