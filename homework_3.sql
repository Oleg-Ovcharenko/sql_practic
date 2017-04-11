-- 1. Получите среднее значение поля amt (таблица orders), не используя при этом функцию AVG(). 
--    Результат должен быть получен одним запросом. Подсказка: используйте вложенный запрос.

SELECT ((SELECT SUM(amt) FROM orders) / (SELECT COUNT(*) FROM orders)) AS res;


-- 2. Получите сумму всех продаж продавца с идентификатором 1007. Попробуйте составить 2 запроса, 
--    получающих одинаковый результат.

SELECT SUM(amt) FROM orders WHERE snum=1007;
SELECT SUM(amt) FROM orders GROUP BY snum HAVING snum = 1007;

-- 3. Получите список городов (без повторов) и максимальный рейтинг для каждого из них из 
--    таблицы customers.

SELECT city, MAX(rating) FROM customers GROUP BY city;

-- 4. Получите список городов (без повторов) и минимальный размер комиссионных для каждого 
--    из них из таблицы salers.

SELECT city, MIN(comm) FROM salers GROUP BY city;