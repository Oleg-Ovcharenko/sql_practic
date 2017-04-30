-- СТРОКОВЫЕ ФУНКЦИИ

-- Строковые функции:
-- ------------------------------
-- 1. CONCAT(str1, str2, ...)
-- Возвращает строку, являющуюся результатом конкатенации аргументов. Если хотя бы один из аргументов равен NULL, возвращается NULL. Может принимать более 2 аргументов. Числовой аргумент преобразуется в эквивалентную строковую форму

SELECT CONCAT(sname, ' ', city) FROM salers;

-- 2. CONCAT_WS(separator, str1, str2, ...)
-- Функция CONCAT_WS() обозначает CONCAT With Separator (конкатенация с разделителем) и представляет собой специальную форму функции CONCAT(). Первый аргумент является разделителем для остальных аргументов. Разделитель, так же как и остальные аргументы, может быть строкой. Если разделитель равен NULL, то результат будет NULL. Данная функция будет пропускать все величины NULL и пустые строки, расположенные после аргумента-разделителя. Разделитель будет добавляться между строками, подлежащими конкатенации

SELECT CONCAT_WS(' ',sname, city, comm) AS res FROM salers;

-- 3. LENGTH(str) - возвращает длину строки в байтах, CHAR_LENGTH(str) - возвращает кол-во символов, CHARACTER_LENGTH(str) -  - возвращает кол-во символов

SELECT sname, LENGTH(sname) FROM salers; -- длинна строки в байтах
SELECT sname, CHAR_LENGTH(sname) FROM salers; -- длинна строки в символах
SELECT * FROM salers WHERE CHAR_LENGTH(sname) < 7;

-- 4. LOCATE(substr,str)
-- Возвращает позицию первого вхождения подстроки substr в строку str. Если подстрока substr в строке str отсутствует, возвращается 0

SELECT LOCATE('ol', 'oleg'); -- на первой позиции находится эта подстрока
SELECT * FROM salers WHERE LOCATE('kin', sname);
SELECT * FROM salers WHERE LOCATE('\'', sname);

-- 5. LEFT(str,len)
-- Возвращает крайние слева len символов из строки str. Данная функция поддерживает многобайтные величины

SELECT odate, LEFT(odate,7) FROM orders; -- берем из odate только первые 7 символов

-- 6. RIGHT(str,len)
-- Возвращает крайние справа len символов из строки str. Данная функция поддерживает многобайтные величины

SELECT odate, RIGHT(odate,5) FROM orders;

-- 7. SUBSTRING(str,pos,len)
-- Возвращает подстроку длиной len символов из строки str, начиная от позиции pos. Данная функция поддерживает многобайтные величины

SELECT SUBSTRING('truezombie', 3);
SELECT odate, SUBSTRING(odate, 1,7) FROM orders;


-- 8. SUBSTRING(str,pos)
-- Возвращает подстроку из строки str, начиная с позиции pos. Данная функция поддерживает многобайтные величины

SELECT odate, SUBSTRING(odate, 6) FROM orders;

-- 9. SUBSTRING_INDEX(str,delim,count)
-- Возвращает подстроку из строки str перед появлениям count вхождений разделителя delim. Если count положителен, то возвращается все, что находится слева от последнего разделителя (считая слева). Если count отрицателен, то возвращается все, что находится справа от последнего разделителя (считая справа). Данная функция поддерживает многобайтные величины

SELECT SUBSTRING_INDEX('http://www.dev.mysql.com/index.php', '/', 3);
SELECT odate, SUBSTRING_INDEX(odate, '-', 2) FROM orders;

-- 10. LTRIM(str)
-- Возвращает строку str с удаленными начальными пробелами. Данная функция поддерживает многобайтные величины

SELECT LTRIM('  Привет я Овчаренко Олег');

-- 11. RTRIM(str)
-- Возвращает строку str с удаленными конечными пробелами. Данная функция поддерживает многобайтные величины

SELECT LTRIM("Oleg    ");

-- 12. TRIM([[BOTH | LEADING | TRAILING] [remstr] FROM] str)
-- Возвращает строку str с удаленными всеми префиксами и/или суффиксами, указанными в remstr. Если не указан ни один из спецификаторов BOTH, LEADING или TRAILING, то подразумевается BOTH. Если аргумент remstr не задан, то удаляются пробелы: 
-- mysql> SELECT TRIM(' bar ');
--         -> 'bar'
-- mysql> SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');
--         -> 'barxxx'
-- mysql> SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');
--         -> 'bar'
-- mysql> SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz');
--         -> 'barx'
-- Данная функция поддерживает многобайтные величины

SELECT LTRIM(RTRIM('    string   ')) AS res;
SELECT TRIM('    string      ') AS res;

SELECT TRIM(TRAILING '-10' FROM odate) FROM orders;
SELECT TRIM(LEADING '1990-' FROM odate) FROM orders;
SELECT TRIM(BOTH 'simple' FROM 'simple string simple');

-- 13. REPLACE(str,from_str,to_str)
-- Возвращает строку str, в которой все вхождения строки from_str заменены на to_str. Данная функция поддерживает многобайтные величины

SELECT REPLACE('http://www.mysql.com', 'www.', '');
SELECT comm, REPLACE(comm, '0.', '') from salers AS res;

-- 14. LCASE(str), LOWER(str)
-- Возвращает строку str, в которой все символы переведены в нижний регистр. Данная функция поддерживает многобайтные величины

SELECT sname, LCASE(sname) FROM salers AS res;

-- 15. UCASE(str), UPPER(str)
-- Возвращает строку str, в которой все символы переведены в верхний регистр. Данная функция поддерживает многобайтные величины

SELECT sname, UCASE(sname) FROM salers AS res;