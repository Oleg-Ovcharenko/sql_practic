--------------- ФУНКЦИИ СТРАВНЕНИЯ СТРОК

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

--------------- МАТЕМАТИЧЕСКИЕ ФУНКЦИИ

-- 1. ABS(X)
-- Возвращает абсолютное значение величины X
SELECT comm, ABS(comm) AS res FROM salers; -- переведет отрицательные числа в положительные

-- 2. SIGN(X)
-- Возвращает знак аргумента в виде -1, 0 или 1, в зависимости от того, является ли X отрицательным, нулем или положительным

SELECT comm, SIGN(comm) AS res FROM salers; -- возвращается -1 для отрицательного числа
SELECT * FROM salers WHERE SIGN(comm) = -1; -- с отрицательным
SELECT * FROM salers WHERE SIGN(comm) = +1; -- всех положительных

-- 3. MOD(N,M)
-- Значение по модулю. Возвращает остаток от деления N на M

SELECT MOD(5, 2);

-- 4. FLOOR(X)
-- Округляет дробь в меньшую сторону

SELECT comm, FLOOR(comm) FROM salers;

-- 5. CEILING(X), CEIL(X)
-- Округляет дробь в большую сторону

SELECT comm, CEIL(comm) FROM salers;

-- 6. ROUND(X)
-- Округляет дробь по правилам математики. Применять с осторожностью - зависит от приложения

SELECT comm, ROUND(comm) FROM salers;

-- 7. ROUND(X,D)
-- Возвращает аргумент X, округленный до числа с D десятичными знаками. Если D равно 0, результат 
-- будет представлен без десятичного знака или дробной части

SELECT comm, ROUND(comm, 1) FROM salers;

-- 8. POW(X,Y), POWER(X,Y)
-- Возвращает значение аргумента X, возведенное в степень Y

SELECT POW(3,2);

-- 9. SQRT(X)
-- Возвращает неотрицательный квадратный корень числа X

SELECT SQRT(9);

-- 10. RAND()
-- Возвращает случайную величину с плавающей точкой в диапазоне от 0 до 1,0

SELECT RAND();
SELECT * FROM salers LIMIT 1;
SELECT * FROM salers ORDER BY RAND() LIMIT 1; -- получить случайную строку 

-- 11. TRUNCATE(X,D)
-- Возвращает X, усеченный до D количества знаков после десятичной точки. Если D 
-- представлен нулем, результат будет без десятичной точки или дробной части. Если D 
-- отрицательно, то часть числа обнуляется.

SELECT comm, TRUNCATE(comm, 1) FROM salers;