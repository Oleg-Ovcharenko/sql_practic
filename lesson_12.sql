-- JOIN
-- INNER JOIN           объединение происходит только на основе справочной целостности
-- LEFT OUTER JOIN      из левой таблицы выбираются все возможные значения
-- RIGHT OUTER JOIN
-- FULL OUTER JOIN
-- CROSS JOIN

-- 1
SELECT * FROM salers INNER JOIN customers ON customers.snum  = salers.snum;

-- 2
SELECT * FROM salers JOIN customers ON customers.snum = salers.snum;

-- 3
SELECT s.sname, c.cname, s.city FROM salers s INNER JOIN customers c ON c.snum = s.snum;

-- 4
SELECT s.sname, c.cname, s.city FROM salers s INNER JOIN customers c ON c.snum = s.snum 
WHERE s.city = 'London';

-- 5
SELECT s.sname, c.cname, s.city FROM salers s INNER JOIN customers c ON c.snum = s.snum;

-- 6
SELECT s.sname, c.cname, s.city FROM salers s  LEFT OUTER JOIN customers c ON
c.snum = s.snum;

-- 7
SELECT s.sname, c.cname, s.city FROM salers s RIGHT OUTER JOIN customers c ON c.snum = s.snum;

-- 8 ERROR не поддерживается 
SELECT s.sname, c.cname, s.city FROM salers s FULL OUTER JOIN customers c ON c.snum = s.snum;