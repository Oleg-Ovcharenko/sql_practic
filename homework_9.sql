-- 1 Получите идентификаторы имена и города клиентов/продавцов из Лондона
SELECT cnum, cname, city FROM customers WHERE city = 'London'
UNION
SELECT snum, sname, city FROM salers WHERE city = 'London';

-- 2 Используя оператор EXISTS получите идентификаторы и имена продавцов, имеющих
-- продажи с суммой более 2000
SELECT snum, sname FROM salers s WHERE EXISTS(
    SELECT * FROM orders o WHERE s.snum = o.snum AND amt > 2000
);