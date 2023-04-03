USE vk;
/*
Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk.
Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, 
профиль и запись из таблицы users. Функция должна возвращать номер пользователя.
*/

DROP FUNCTION fun_del;

SET SQL_SAFE_UPDATES = 0;

DELIMITER //
CREATE FUNCTION fun_del(user_id BIGINT UNSIGNED)
RETURNS FLOAT READS SQL DATA
  BEGIN
    DECLARE `result` FLOAT;
    
    SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM users
	WHERE id = user_id;
    SET FOREIGN_KEY_CHECKS=1;

	SET `result` = id;
    RETURN `result`;
  END//
DELIMITER ;

SELECT fun_del(1);

/*
Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.
*/
START TRANSACTION;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM users WHERE id = 2;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;