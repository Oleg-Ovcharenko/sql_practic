-- 1
SELECT sname, city FROM salers WHERE city = 'Barcelona' OR city = 'London';

SELECT sname, city FROM salers WHERE city = 'New York' OR city = 'London' OR city = 'Barcelona';

-- IN (В)

-- 2 Получить продавцов которые есть в любом из трех городов
SELECT sname, city FROM salers WHERE city IN ('London', 'New York', 'Barcelona');

-- BETWEEN (между)

-- 3 
SELECT * FROM salers WHERE comm IN (0.11, 0.12, 0.13, 0.15);

-- 4
SELECT * FROM salers WHERE comm BETWEEN 0.11 AND 0.15;

-- 5
SELECT * FROM salers WHERE (comm BETWEEN 0.11 AND 0.15) AND comm NOT IN (0.11, 0.15);

-- 6
SELECT sname FROM salers WHERE sname BETWEEN 'A' AND 'N';

-- NULL (не тип и не значение) - отсутствие значения (пустота)
-- нужно настраивать таблицу на то, что пустые поля будут заполнены как null 
-- Необязательное значение к заполнению например
-- SELECT * FROM salers where sname=null; НЕ БУДЕТ РАБОТАТЬ. 

-- 7
SELECT * FROM salers  WHERE sname IS NULL;

-- 8 
-- Отобразить всю таблицу без полей NULL
SELECT * FROM salers  WHERE sname IS NOT NULL;

-- LIKE (Подходит для организации поиска - php). Рекомендуется использовать только для полей
-- char и varchar. Оператор LIKE классно работает с небольшими базами данных. Несколько сотен строк.
-- в место LIKE на больших базах лучше использовать полнотекстовый поиск

-- 9 %-сколько угодно символов и каких без разницы
SELECT * FROM salers WHERE sname LIKE 'Mot%';

-- 10 
SELECT * FROM salers WHERE sname LIKE '%kin';

-- 11 _- только одни любой символ
SELECT * FROM salers WHERE sname LIKE 'P__l';