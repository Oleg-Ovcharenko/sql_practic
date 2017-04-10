-- ВЫБОРКА ДАННЫХ ИЗ БАЗЫ

-- 1 - Получить всю таблицу orders
SELECT * FROM orders;

-- 2 - onum  - идентификатор заказа
--   - amt   - сумма заказаза 
--   - odate - дата совершения заказа
--   - cnum  - идентификатор клиента который совершил заказ
--   - snum  - идентификатор продавца у которого был совершен заказ
SELECT onum, amt, odate, cnum, snum FROM orders; 

-- 3 - Получить поля сумма заказа и дата
SELECT amt, odate FROM orders;

-- 4 - DISTINCT выкинуть повторяющиеся даты
SELECT DISTINCT odate FROM orders;

-- 5 - Выбрать данные за апрель (предикаты)
SELECT odate, amt FROM orders WHERE odate='1990-04-10';
--   - Выбрать клиентов у которых рейтинг 200
SELECT cname, city FROM customers WHERE rating=200;
--   - Выбрать продавцов из Лондона
SELECT * FROM salers WHERE city='London';

-- 6 - Установить кодировку соиденения
SET NAMES sp866;

-- РЕЛЯЦИОННЫЕ И БУЛЕВЫ ОПЕРАТОРЫ

-- Релационные операторы или операторы сравнения

-- "="  равенство
-- ">"  больше чем
-- "<"  меньше чем
-- ">=" больше или равно
-- "<=" меньше или равно
-- "<>", "!=" неравно "оператора неравенства"

-- 1 - Выбрать операции совершенные больше чем на 1000
SELECT amt FROM orders WHERE amt > 1000;
--   - Выбрать операции совершенные меньше чем на 1000
SELECT amt FROM orders WHERE amt < 1000;
--   - Выбрать больше или равно 1900.10
SELECT amt FROM orders WHERE amt >= 1900.10;

-- 2 - Выбрать продавцов которые не работают в Лондоне
SELECT sname, city FROM salers WHERE city <> 'London';

-- 3 - Отсортировать строки
SELECT sname FROM salers ORDER BY sname;

-- 4 - Показать строи МЕНЬШЕ Rifkin
SELECT sname, city FROM salers WHERE sname > 'Rifkin';


-- БУЛЕВЫ ОПЕРАТОРЫ 

-- AND, OR, NOT

-- 11 Сложный оператор выбора
SELECT * FROM orders WHERE amt > 1000 AND odate = '1990-06-10';
      
SELECT amt FROM orders WHERE amt > 1000 AND amt < 4000;

SELECT * FROM salers  WHERE city = 'London' AND comm > 0.11;

-- 12 Инвертирование
SELECT * FROM customers WHERE NOT city = 'London';

-- 13 Сотавление сложных запросов
SELECT * FROM  orders 
	WHERE NOT ((odate = '1990-03-10' AND snum > 1002) OR amt > 2000.00);
-- инвертированный результат 3003, 3009, 3007, 3010
-- результат без инверсии (без учета NOT) 3001, 3002, 3006, 3005, 3008, 3011 