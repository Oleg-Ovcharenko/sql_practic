-- 1. Напишите запрос, который выберет все ряды из таблицы заказов (orders) за март-апрель

    SELECT * FROM orders WHERE odate IN ('1990-03-10', '1990-04-10');

-- 2. Выберите всех клиентов (таблица customers) продавцов Peel и Motika.

    SELECT snum FROM salers WHERE sname IN ("Peel", "Motika");
    SELECT cname FROM customers WHERE snum IN (1001, 1004);

    SELECT cname FROM customers WHERE snum IN (SELECT snum FROM salers WHERE sname IN ("Peel", "Motika"));

-- 3. Составьте запрос, который выведет всех клиентов, чьи имена находятся в диапазоне A-G включительно.

    SELECT cname FROM customers WHERE cname BETWEEN 'A' AND 'H';

-- 4. Выберите всех представителей, чьи имена начинаются с латинской литеры "S".

    SELECT sname FROM salers WHERE sname LIKE "S%";

-- 5. Выберите всех представителей, чьи имена начинаются на латинскую литеру "D" и при этом заканчиваются
--    на латинскую литеру "n". Выборка проведите 2-мя различными способами (2 различных запроса, дающих одинаковый результат).

    SELECT sname FROM salers WHERE sname LIKE 'D%' AND sname LIKE '%n';
    SELECT sname FROM salers WHERE sname LIKE 'D%n';

-- 6. Выберите всех представителей, чьи имена заканчиваются на латинскую литеру "n", но при этом не начинаются на латинскую литеру "D".

    SELECT sname FROM salers WHERE sname LIKE '%n' AND sname NOT LIKE 'D%';

-- 7. Выберите все ряды с NULL-значениями из таблицы продавцов.

    SELECT * FROM salers  WHERE sname IS NULL;
