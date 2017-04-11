-- 1
SELECT sname, comm FROM salers;

-- 2
SELECT sname, comm*100 FROM salers;

-- 3
SELECT sname, comm*100, '%' FROM salers;

-- СОРТИРОВКИ
-- 4
SELECT * FROM orders ORDER BY onum;

-- 5
SELECT * FROM salers ORDER BY sname;

-- ASC DESC
-- 6
SELECT * FROM salers ORDER BY sname ASC;

-- 7
SELECT snum, amt, odate FROM orders ORDER BY snum, amt;

--8
SELECT snum, MAX(amt) AS res FROM orders GROUP BY snum ORDER BY res;

--9
SELECT snum, MAX(amt) FROM orders GROUP BY snum ORDER BY 2;

-- Ограничение вывода
-- 10

SELECT * FROM salers LIMIT 0,2; 

-- 11 Самая последняя запись с таблицы
SELECT * FROM salers ORDER BY snum DESC LIMIT 1;

-- Объединение таблиц
-- 12
SELECT sname, cname FROM salers, customers;

-- 13
SELECT salers.sname, customers.cname, salers.city FROM salers, customers;

-- 14
SELECT salers.sname, customers.cname, salers.city 
    FROM salers, customers 
        WHERE salers.snum = customers.snum
            ORDER BY salers.sname;

-- Присвоение псевдонимов таблицам
SELECT s.sname, c.cname, s.city FROM salers s, customers c WHERE s.snum = c.snum ORDER BY s.sname;