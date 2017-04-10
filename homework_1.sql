-- 1. Выберите из таблицы заказов (orders) номера всех заказов, их суммы и даты.
	
SELECT onum, amt, odate FROM orders;

-- 2. Составьте запрос, который выберет строки из таблицы клиентов (customers), номер продавца которых равен 1001.
    
SELECT * FROM customers WHERE snum=1001;

-- 3. Выберите имена клиентов города San Jose и их рейтинг из таблицы клиентов (customers).

SELECT cname, rating FROM customers WHERE city='San Jose';

-- 4. Выберите идентификаторы продавцов из таблицы заказов (orders), при этом исключите повторы.

SELECT DISTINCT snum FROM orders;

-- 5. Получите все ряды из таблицы заказов (orders), где сумма заказа больше 1000.

SELECT * FROM orders WHERE amt > 1000;

-- 6. Выберите название города и имена продавцов в Лондоне с размером комиссионных выше 0.11 из таблицы продавцов (salers).

SELECT city, sname FROM salers WHERE city='London' AND comm>0.11;	

-- 7. Выберите всех клиентов из таблицы клиентов (customers), у которых рейтинг меньше или равен 100 и они при этом не из Рима.
--    В запросе должен использоваться оператор NOT.
	
SELECT * FROM customers WHERE rating<=100 AND NOT city='Rome'; 

--8. Упростите запрос: "SELECT * FROM salers WHERE comm < 0.12 OR comm = 0.12;".

SELECT * FROM salers WHERE comm <= 0.12;	

--9. Подумайте, что будет выбрано в результате следующего запроса: 

"SELECT * FROM orders
       WHERE (amt < 1000 OR NOT (odate = '1990-03-10' AND cnum > 2003 ));"

-- Первая часть условия: 3001, 3003, 3007     
-- Вторая часть условия: 3005, 3009, 3008, 3010, 3011

