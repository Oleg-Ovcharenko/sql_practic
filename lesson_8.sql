-- ФУНКЦИИ СТРАВНЕНИЯ СТРОК

-- Поик совпадения
SELECT 'a' REGEXP 'a'; --1
SELECT 'a' REGEXP 'b'; --0

-- 3
SELECT * FROM salers WHERE sname REGEXP '[a-z]';

-- 4
SELECT * FROM salers WHERE sname REGEXP '[а-я]';

-- 5
SELECT * FROM salers WHERE sname REGEXP '[a-zа-я]';

-- 6
SELECT * FROM salers WHERE sname REGEXP '^s'; -- строго первая буква должна быть s

-- 7
SELECT * FROM salers WHERE sname REGEXP '^n'; -- имена которые заканчиваются на n

-- 8
SELECT * FROM salers WHERE sname REGEXP '^[^r].*'; -- имена которые не начинаются с r

-- 9 
SELECT * FROM salers WHERE sname REGEXP '^[^r]*$'; -- исключить все строки где встречается r

-- 10
SELECT * FROM salers WHERE sname REGEXP '[r]{2}'; -- имена где есть двойное r
SELECT * FROM salers WHERE sname REGEXP '(r){2}'; -- имена где есть двойное r
SELECT * FROM salers WHERE sname REGEXP '(rr)';   -- имена где есть двойное r

-- 11
SELECT * FROM salers WHERE sname REGEXP '\''; -- найти имена где есть апостроф


-- МАТЕМАТИЧЕСКИЕ ФУНКЦИИ