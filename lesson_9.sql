-- Работа с датой и временем

-- 1. NOW(), SYSDATE(), CURRENT_TIMESTAMP
-- Возвращает текущую дату и время как величину в формате YYYY-MM-DD HH:MM:SS или YYYYMMDDHHMMSS, в 
-- зависимости от того, в каком контексте используется функция - в строковом или числовом.
-- Заметьте, что NOW() вычисляется только единожды для каждого запроса, а именно - в начале его 
-- выполнения. Это позволяет быть уверенным в том, что множественные ссылки на NOW() в рамках 
-- одного запроса дадут одно и то же значение

SELECT NOW();
SELECT SYSDATE();
SELECT CURRENT_TIMESTAMP();

SELECT NOW(), NOW()+0; -- получить данные ввиде числа

-- 2. CURDATE(), CURRENT_DATE
-- Возвращает сегодняшнюю дату как величину в формате YYYY-MM-DD или YYYYMMDD, в зависимости от того, 
-- в каком контексте используется функция - в строковом или числовом

SELECT CURDATE();  

-- 3. CURTIME(), CURRENT_TIME 
-- Возвращает текущее время как величину в формате HH:MM:SS или HHMMS, в зависимости от того, в 
-- каком контексте используется функция - в строковом или числовом

SELECT CURTIME();

-- 4. DAYOFWEEK(date)
-- Возвращает индекс дня недели для аргумента date (1 = воскресенье, 2 = понедельник, ... 7 = суббота).
-- Эти индексные величины соответствуют стандарту ODBC.

SELECT odate, DAYOFWEEK(odate) FROM orders;
SELECT DAYOFWEEK(NOW());

-- 5. WEEKDAY(date)
-- Возвращает индекс дня недели для аргумента date (0 =понедельник, 1 = вторник, ... 6 = воскресенье)

SELECT odate, WEEKDAY(odate) FROM orders;

-- 6. DAY(date), DAYOFMONTH(date)
-- Возвращает порядковый номер дня месяца для аргумента date в диапазоне от 1 до 31

SELECT odate, DAY(odate) FROM orders;
SELECT DAY(NOW());

-- 7. DAYOFYEAR(date)
-- Возвращает порядковый номер дня года для аргумента date в диапазоне от 1 до 366

SELECT DAYOFYEAR(NOW());

-- 8. MONTH(date)
-- Возвращает порядковый номер месяца в году для аргумента date в диапазоне от 1 до 12

SELECT MONTH(NOW());

-- 9. DAYNAME(date)
-- Возвращает название дня недели для аргумента date

SELECT odate, DAYNAME(odate) FROM orders;
SELECT DAYNAME(NOW());

-- 10. MONTHNAME(date) || SET lc_time_names = 'ru_RU'
-- Возвращает название месяца для аргумента date

SELECT odate, MONTHNAME(odate) FROM orders;
SELECT MONTHNAME(NOW());

-- 11. QUARTER(date)
-- Возвращает номер квартала года для аргумента date в диапазоне от 1 до 4

SELECT odate, QUARTER(odate) FROM orders;
SELECT QUARTER(NOW());

-- 12. YEAR(date)
-- Возвращает год для аргумента date в диапазоне от 1000 до 9999 или 0 для "zero" даты

SELECT odate, YEAR(odate) FROM orders;
SELECT YEAR(NOW());

-- 13. HOUR(time)
-- Возвращает час для аргумента time в диапазоне от 0 до 23

SELECT HOUR(NOW());

-- 14. MINUTE(time)
-- Возвращает количество минут для аргумента time в диапазоне от 0 до 59

SELECT MINUTE(NOW());

-- 15. SECOND(time)
-- Возвращает количество секунд для аргумента time в диапазоне от 0 до 59

SELECT SECOND(NOW());

-- 16. PERIOD_ADD(P,N)
-- Добавляет N месяцев к периоду P (в формате YYMM или YYYYMM). Возвращает величину в формате YYYYMM. 
-- Следует учитывать, что аргумент периода P не является значением даты

SELECT odate, date_format(odate, '%Y%m'), PERIOD_ADD(date_format(odate, '%Y%m'),7) FROM orders;
SELECT PERIOD_ADD(date_format(now(), '%Y%m'),30);
SELECT PERIOD_ADD(DATE_FORMAT(NOW(), '%Y%m'),2);

-- 17. PERIOD_DIFF(P1,P2)
-- Возвращает количество месяцев между периодами P1 и P2. P1 и P2 должны быть в формате YYMM или YYYYMM.
-- Следует учитывать, что аргументы периода P1 и P2 не являются значениями даты

SELECT PERIOD_DIFF(201205, 201203);

-- 18. DATE_ADD(date,INTERVAL expr type) син. ADDDATE(date,INTERVAL expr type); ADDDATE(expr,days)
-- DATE_SUB(date,INTERVAL expr type) син. SUBDATE(date,INTERVAL expr type); SUBDATE(expr,days) 
-- Данные функции производят арифметические действия над датами. Обе являются нововведением версии 
-- MySQL 3.22. Функции ADDDATE() и SUBDATE() - синонимы для DATE_ADD() и DATE_SUB(). В версии MySQL 
-- 3.23 вместо функций DATE_ADD() и DATE_SUB() можно использовать операторы + и -, если выражение с 
-- правой стороны представляет собой столбец типа DATE или DATETIME. Аргумент date является величиной 
-- типа DATETIME или DATE, задающей начальную дату. Выражение expr задает величину интервала, который
-- следует добавить к начальной дате или вычесть из начальной даты. Выражение expr представляет собой 
-- строку, которая может начинаться с - для отрицательных значений интервалов. Ключевое слово type 
-- показывает, каким образом необходимо интерпретировать данное выражение. Вспомогательная функция 
-- EXTRACT(type FROM date) возвращает интервал указанного типа (type) из значения даты.

SELECT NOW(), ADDDATE(NOW(), INTERVAL 1 minute);            -- добавить одну минуту
SELECT NOW(), ADDDATE(NOW(), INTERVAL '1:1' minute_second); -- добавить минуту и секунду
SELECT NOW(), ADDDATE(NOW(), INTERVAL '2:5' day_hour);
SELECT NOW(), NOW() + INTERVAL '1' HOUR;

SELECT NOW(), NOW() - INTERVAL '1' HOUR;
SELECT NOW(), SUBDATE(NOW(), INTERVAL '2' HOUR);

SELECT NOW(), ADDDATE(NOW(), 10); -- добавить десять дней
SELECT NOW(), SUBDATE(NOW(), 10); -- вычесть десять дней

-- 19. EXTRACT(type FROM date)
-- Типы интервалов для функции EXTRACT() используются те же, что и для функций DATE_ADD() или DATE_SUB(),
-- но EXTRACT() производит скорее извлечение части из значения даты, чем выполнение арифметических 
-- действий

SELECT NOW(), EXTRACT(MINUTE FROM NOW()); -- получить минуты
SELECT NOW(), EXTRACT(DAY FROM NOW()); -- получить день

-- 20. DATE_FORMAT(date,format)
-- Форматирует величину date в соответствии со строкой format
-- 9/05/2017
SELECT NOW(), DATE_FORMAT(NOW(), '%e/%m/%Y');
-- 9 May 2017
SELECT NOW(), DATE_FORMAT(NOW(), '%e %M %Y');

-- 21. TIME_FORMAT(time,format)
-- Данная функция используется аналогично описанной выше функции DATE_FORMAT(), но строка format может
-- содержать только те определители формата, которые относятся к часам, минутам и секундам. При указании 
-- других определителей будет выдана величина NULL или 0

SELECT NOW(), TIME_FORMAT(NOW(), '%H:%i');

-- 22. SEC_TO_TIME(seconds)
-- Возвращает аргумент seconds, преобразованный в часы, минуты и секунды, как величину в формате 
-- HH:MM:SS или HHMMSS, в зависимости от того, в каком контексте используется функция - в строковом 
-- или числовом

SELECT SEC_TO_TIME(60);

-- 23. TIME_TO_SEC(time)
-- Возвращает аргумент time, преобразованный в секунды

SELECT TIME_TO_SEC('1:00:00');
SELECT TIME_TO_SEC('60:00');

-- 24. DATE(expr)
-- Возвращает часть, отвечающую за дату

SELECT NOW(), DATE(NOW());

-- 25. TIME(expr)
-- Возвращает часть, отвечающую за время

SELECT NOW(), TIME(NOW());

-- 26. DATEDIFF(expr1, expr2)
-- Возвращает разницу дат.

-- 27. TO_DAYS()
-- Количество дней от заданой даты 