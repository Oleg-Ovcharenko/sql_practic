-- 1 Объединение таблиц с собой... получаем пары заказчиков с одинаковыми рейтингами
SELECT f.cname, s.cname, f.rating FROM customers f, customers s WHERE f.rating = s.rating ORDER BY rating;

-- 2 Объединение таблиц с собой... получаем пары заказчиков с одинаковыми рейтингами - устраняем избыточность
SELECT f.cname, s.cname, f.rating FROM customers f, customers s WHERE f.rating = s.rating AND f.cname < s.cname ORDER BY rating;

-- 3 Объединение таблиц с собой... Выбрать несколько продавцов в одном городе
SELECT f.sname, s.sname, s.city FROM salers f, salers s WHERE f.city = s.city AND f.sname < s.sname;

-- 4 Выборка всех клиентов продавца
SELECT cname FROM customers WHERE snum = (SELECT snum FROM salers WHERE sname = 'Peel');

-- 5 Запрос, возвращающий ошибку, посколько результатом подзапроса есть множесто
SELECT * FROM orders WHERE snum = (SELECT snum FROM salers WHERE city = 'London');

-- 6 Тот же запрос, но без ошибки
SELECT * FROM orders WHERE snum IN (SELECT snum FROM salers WHERE city = 'London');

-- 7 Выбрать всех прдавцов у которых больше чем 1 клиент
SELECT snum, sname FROM salers WHERE snum IN (SELECT snum FROM customers GROUP BY snum HAVING COUNT(snum) > 1);

-- 8 Выбрать продавцов у которых нет клиентов
SELECT snum, sname FROM salers WHERE snum NOT IN (SELECT snum FROM customers);

-- 9 Соотнесенный подзапрос... выборка всех клиентов за апрель
SELECT * FROM customers c WHERE '1990-04-10' IN (SELECT odate FROM orders o WHERE o.cnum = c.cnum);

-- 10 Тот же результат, но с объединением таблиц на основе справочной целостности
SELECT o.cnum, c.cname, c.city, c.rating, c.snum FROM orders o, customers c WHERE c.cnum = o.cnum AND odate = '1990-04-10';