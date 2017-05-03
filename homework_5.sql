-- 1 Из таблицы salers выберите продавцов, имена которых состоят из 6 и более символов

SELECT sname FROM salers WHERE CHAR_LENGTH(sname) >= 6;

-- 2 Выберите все поля из таблицы orders при этом результирующая таблица должна удовлетворять 
-- двум условиям - поля должны иметь те же имена, что и таблица orders, значения поля odate должны иметь формат ГГГГ/ММ/ДД

SELECT onum, amt, REPLACE(odate, '-', '/') AS odate, cnum, snum FROM orders;

-- 3 Получите только целые части (без дробной части) сумм из таблицы orders

SELECT amt, SUBSTRING_INDEX(amt, '.', 1) AS amt FROM orders;

-- 4 Получите месяц и число из таблицы orders (разрешается использовать только функцию SUBSTRING_INDEX), при этом 
-- в результирующей таблице формат вывода должен иметь вид ММ/ДД

SELECT SUBSTRING_INDEX(REPLACE(odate, '-', '/'), '/', -2) AS odate FROM orders;

-- 5 Получите из таблицы salers данные обо всех продавцах, имена которых записаны кириллицей 
-- (подсказка - работоспособность данного способа зависит от кодировки)

SELECT * FROM salers WHERE LENGTH(sname) <> CHAR_LENGTH(sname);