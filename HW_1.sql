CREATE SCHEMA `HW_Seminar_1` ;

CREATE TABLE `HW_Seminar_1`.`Phone` (
  `name` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `count` INT NOT NULL,
  `price` INT NOT NULL);

INSERT INTO phone
(name, manufacturer, count, price)
VALUES('Iphone 10', 'apple', 10, 200000);
INSERT INTO phone
(name, manufacturer, count, price)
VALUES('Samsung S22', 'Samsung', 15, 300000);
INSERT INTO phone
(name, manufacturer, count, price)
VALUES('Nokia Ultra', 'Nokia', 10, 25000);
INSERT INTO phone
(name, manufacturer, count, price)
VALUES('Iphone 13', 'apple', 15, 400000);
INSERT INTO phone
(name, manufacturer, count, price)
VALUES('Iphone 12', 'apple', 8, 300000);
INSERT INTO phone
(name, manufacturer, count, price)
VALUES('Iphone 14', 'apple', 8, 500000);


SELECT name, manufacturer, price
FROM phone
WHERE count>2;
SELECT *
FROM phone
WHERE manufacturer=Samsung;