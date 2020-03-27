-- Заполнение таблиц --


-- Заполнение таблицы categories --
INSERT INTO categories(categ_id, categ_name, categ_nick)
VALUES
(null, 'Доски и лыжи', 'boards'), 
(null, 'Крепления', 'attachment'),
(null, 'Ботинки','boots'),
(null, 'Одежда','clothing'), 
(null,'Инструменты','tools'),
(null, 'Разное', 'other');

-- Заполнение таблицы users --
INSERT INTO users 
(user_id, user_name, user_email, 
user_password, user_signup_date, user_image, user_contact)
VALUES 
(null, 'Barikada11', 'briki@mail.ru', 'awe34re', '20150618', null, null),
(null, 'Veronika21','yourdream11@mail.ru', 'gh3423dfeq', '20160722', null, null),
(null, 'SpoonFork', 'dish2005@gmail.com', 'IlIK3F00d', '20180302', null, null);

-- Заполнение таблицы lots --
INSERT INTO lots
(lot_id, lot_user_id, lot_winner_id, lot_name, lot_categ_id, lot_discr, lot_image, 
lot_cr_date, lot_comp_date, lot_start_price, lot_step)
VALUES
(null, 1, null, '2014 Rossignol District Snowboard', 
1 , 'Временно отсутствует', 'img/lot-1.jpg', '2020-03-27 10:34:15', '2020-03-28 10:34:15', 
10999, 500),
(null, 1, 2, 'DC Ply Mens 2016/2017 Snowboard', 
1 , 'Временно отсутствует', 'img/lot-2.jpg', '2020-03-26 01:22:05', '2020-03-27 01:22:05', 
159999, 500),
(null, 2, null, 'Крепления Union Contact Pro 2015 года размер L/XL', 
2 , 'Временно отсутствует', 'img/lot-3.jpg', '2020-03-27 22:34:15', '2020-03-28 22:34:15',  
8000, 500),
(null, 1, null, 'Ботинки для сноуборда DC Mutiny Charocal', 
3 , 'Временно отсутствует', 'img/lot-4.jpg', '2020-03-27 13:32:12', '2020-03-28 13:32:12', 
10999, 500),
(null, 3, 1, 'Куртка для сноуборда DC Mutiny Charocal', 
4 , 'Временно отсутствует', 'img/lot-5.jpg', '2020-03-26 04:34:15', '2020-03-27 04:34:15', 
7500, 500),
(null, 3, 2, 'Маска Oakley Canopy', 
6 , 'Временно отсутствует', 'img/lot-6.jpg', '2020-03-25 18:40:59', '2020-03-26 18:40:59', 
5400, 500);

-- Заполнение таблицы rate --
INSERT INTO rate(rate_id, lot_id, user_id, rate_date, rate_price)
VALUES
(null, 1, 3, '2020-03-27 12:34:15', 18800),
(null, 1, 2, '2020-03-28 09:34:15', 126480);



-- Запросы --


-- Получить все категории --
SELECT categ_name
FROM categories

/* Получить самые новые, открытые лоты. Каждый лот должен включать название, 
стартовую цену, ссылку на изображение, цену последней ставки, количество 
ставок, название категории 
*/
SELECT DISTINCT lot_name, lot_start_price, lot_image, MAX(rate_price) as 'Маскимальная ставка', count(c.rate_id) as 'Количество ставок', categ_name 
FROM categories a inner join lots b on categ_id=lot_categ_id inner join 
rate c on b.lot_id=c.lot_id
WHERE CURDATE()<lot_comp_date
group by lot_name
ORDER BY  lot_cr_date DESC


-- Показать лот по его id. Получите также название категории, к которой принадлежит лот --
SELECT lot_name, categ_name 
FROM categories a inner join lots b on categ_id=lot_categ_id
WHERE lot_id=2

-- Обновить название лота по его идентификатору --
UPDATE lots 
SET lot_name="Крепления Union Contact Pro 2015 года размер L/XXXL"
WHERE lot_id=3

-- Получить список самых свежих ставок для лота по его идентификатору --
SELECT rate_id, lot_name, rate_price
from rate a inner join lots b on a.lot_id=b.lot_id
where a.lot_id=1
ORDER BY  rate_date desc 