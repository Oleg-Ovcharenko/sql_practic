-- СОЗДАНИЕ СВЯЗЕЙ МЕЖДУ ТАБЛИЦАМИ

-- 1
CREATE TABLE country 
(
    country_id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (country_id)
) ENGINE=InnoDB;

-- 2
CREATE TABLE city
(
    city_id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
    city_name VARCHAR(50) NOT NULL,
    country_id TINYINT UNSIGNED NOT NULL, 
    PRIMARY KEY (city_id),
    INDEX ixCity (country_id),
    CONSTRAINT country_city FOREIGN KEY (country_id) REFERENCES country (country_id)
) ENGINE=InnoDB;

-- COUNT(), SUM(), AVG(), MIN(), MAX() || GROUP BY, HAVING

-- 3
SELECT count(sname) FROM salers; 

-- 4
SELECT count(city) FROM salers;

-- 5
SELECT count(*) FROM salers;

-- 6
SELECT COUNT(DISTINCT city) FROM salers;

-- 7 псевдоним
SELECT COUNT(*) AS res FROM salers;

-- 8 получить сумму
SELECT SUM(amt) AS res FROM orders;

-- 9 среднее значение
SELECT AVG(amt) AS res FROM orders;

-- 10 минимальное значение 
SELECT MIN(amt) AS res FROM orders;

-- 11 максимальное значение 
SELECT MAX(amt) AS res FROM orders;

-- 12 
SELECT snum, MAX(amt) FROM orders WHERE snum=1007;

-- 13 Максимальная сумма продажи продавца
SELECT snum, MAX(amt) FROM orders GROUP BY snum;