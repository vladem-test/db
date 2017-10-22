delete from [Transactions]
delete from [Details]
delete from [Operation]
delete from [Car]
delete from [Status]
delete from [Order]
delete from [Customer]
delete from [Employee]
delete from [ServiceType]
delete from [Department]
delete from [Job]
delete from [City]
delete from [Model]
delete from [Manufacturer]
delete from [State]

SET DATEFORMAT dmy

insert into [Manufacturer] VALUES ('BMW')
insert into [Manufacturer] VALUES ('Audi')
insert into [Manufacturer] VALUES ('Kia')
insert into [Manufacturer] VALUES ('Nissan')
insert into [Manufacturer] VALUES ('Bugatti')
insert into [Manufacturer] VALUES ('Lamborghiny')
insert into [Manufacturer] VALUES ('Lada')
insert into [Manufacturer] VALUES ('Mersedes')
insert into [Manufacturer] VALUES ('Porsche')
insert into [Manufacturer] VALUES ('Renault')

insert into [Model] VALUES ('i8', 10 ,1)
insert into [Model] VALUES ('x5', 10, 1)
insert into [Model] VALUES ('S8', 7, 2)
insert into [Model] VALUES ('Q5', 8, 2)
insert into [Model] VALUES ('Rio', 10, 3)
insert into [Model] VALUES ('Optima', 1, 3)
insert into [Model] VALUES ('Maxima', 100, 4)
insert into [Model] VALUES ('Murano', 10, 4)
insert into [Model] VALUES ('CHIRON', 15, 5)
insert into [Model] VALUES ('VEYRON', 20, 5)
insert into [Model] VALUES ('Aventador', 10 ,6)
insert into [Model] VALUES ('Gallardo', 10, 6)
insert into [Model] VALUES ('Kalina', 7, 7)
insert into [Model] VALUES ('Priora', 8, 7)
insert into [Model] VALUES ('S-class', 10, 8)
insert into [Model] VALUES ('Sprinter', 1000, 8)
insert into [Model] VALUES ('Boxster', 100, 9)
insert into [Model] VALUES ('Cayman', 10, 9)
insert into [Model] VALUES ('Logan', 15, 10)
insert into [Model] VALUES ('Pulse', 20, 10)

insert into [State] VALUES ('Москва и МО')
insert into [State] VALUES ('Адыгея')
insert into [State] VALUES ('Алтай')
insert into [State] VALUES ('Башкортостан')
insert into [State] VALUES ('Дагестан')
insert into [State] VALUES ('Ингушетия')
insert into [State] VALUES ('Мордовия')
insert into [State] VALUES ('Татарстан')
insert into [State] VALUES ( 'Чечня')
insert into [State] VALUES ('Калмыкия')

insert into [City] VALUES ('Moscow', 1)
insert into [City] VALUES ('Майкоп', 2)
insert into [City] VALUES ('Горно-Алтайск', 3)
insert into [City] VALUES ('Уфа`', 4)
insert into [City] VALUES ('Махачкала', 5)
insert into [City] VALUES ('Магас', 6)
insert into [City] VALUES ('Саранск', 7)
insert into [City] VALUES ('Казань', 8)
insert into [City] VALUES ('Грозный', 9)
insert into [City] VALUES ('Элиста', 10)

insert into [Job] VALUES ('Управляющий')
insert into [Job] VALUES ('Механик')
insert into [Job] VALUES ('Уборшик')
insert into [Job] VALUES ('Водитель')
insert into [Job] VALUES ('Ген. Директор')
insert into [Job] VALUES ('Охранник')
insert into [Job] VALUES ('Ассистент')
insert into [Job] VALUES ('Хостес')

insert into [Department] VALUES ('Дмитровская ул. 15/1', 100, 1)
insert into [Department] VALUES ('Ул. Ленина 14/1', 100, 2)
insert into [Department] VALUES ('Ул. Ульянова 29/4', 50, 3)
insert into [Department] VALUES ('Кронштадсткий Переулок 15/1', 100, 4)
insert into [Department] VALUES ('Сувостопольская ул. 15/1', 100, 5)
insert into [Department] VALUES ('Площадь Ильича 15/1', 100, 6)
insert into [Department] VALUES ('Проезд Петра Первого 15/1', 100, 7)
insert into [Department] VALUES ('Ленинский проспект 10/1', 100, 8)
insert into [Department] VALUES ('10ая парковая ул. 7/1', 100, 9)
insert into [Department] VALUES ('Ул. Строителей 20/1', 100, 10)

insert into [ServiceType] VALUES ('Смена колес', 1, 1)
insert into [ServiceType] VALUES ('Покраска', 5, 0)
insert into [ServiceType] VALUES ('Тонирование', 9, 0)
insert into [ServiceType] VALUES ('Смена кузова', 4, 1)
insert into [ServiceType] VALUES ('Полировка', 5, 0)
insert into [ServiceType] VALUES ('Чистка салона', 0, 0)
insert into [ServiceType] VALUES ('Тех. осмотр', 4, 0)
insert into [ServiceType] VALUES ('Смена двигателя', 9, 1)
insert into [ServiceType] VALUES ('Замена свеч', 2, 1)
insert into [ServiceType] VALUES ('Установка боковых зеркал', 6, 0)

insert into [Employee] VALUES (1, 'Егор', 'Борисов', 3, 1, NULL)
insert into [Employee] VALUES (2, 'Валерий', 'Ожогов', 1, 1, 3)
insert into [Employee] VALUES (1, 'Антонина', 'Борисова', 2, 2, NULL)
insert into [Employee] VALUES (2, 'Серофима', 'Овечкина', 3, 2, 2)
insert into [Employee] VALUES (1, 'Николай', 'Отменный', 4, 3, NULL)
insert into [Employee] VALUES (2, 'Юлия', 'Нетвинная', 5, 3, 1)
insert into [Employee] VALUES (6, 'Кирилл', 'Квантов', 6, 8, NULL)
insert into [Employee] VALUES (7, 'Олег', 'Щеглов', 7, 9, NULL)
insert into [Employee] VALUES (4, 'Тимур', 'Гневный', 4, 4, NULL)
insert into [Employee] VALUES (8, 'Наталья', 'Натальевна', 1, 5, NULL)

insert into [Customer] VALUES ('Паша', 'Ленный', 'pasha@gmail.com', 1, 700,'1/2/2010')
insert into [customer] VALUES ('Семен', 'Рогов', 'rogov@gmail.com', 2, 500, '1/2/2010')
insert into [customer] VALUES ('Николай', 'Толстой', 'asdfsadf@gmail.com', 3, 10000, '1/2/2010')
insert into [customer] VALUES ('Алексей', 'Вонтиков', 'vontovo@gmail.com', 4, 1700, '1/2/2010')
insert into [customer] VALUES ('Олеся', 'Ответственная', 'responsible@gmail.com', 5, 3700, '1/2/2010')
insert into [customer] VALUES ('Саша', 'Анель', 'anel@gmail.com', 6, 7004, '1/2/2010')
insert into [customer] VALUES ('Агния', 'Кудкина', 'agn@gmail.com', 7, 7004, '1/2/2010')
insert into [customer] VALUES ('Михаил', 'Шолохов', 'michail@gmail.com', 8, 234700, '1/2/2010')
insert into [customer] VALUES ('Борис', 'Худой', 'boris@gmail.com', 9, 0, '1/2/2010')
insert into [customer] VALUES ('Лиля', 'Семенова', 'lily@gmail.com', 10, 50, '1/2/2010')

insert into [Order] ([end_date], [total], [manager_id], [customer_id]) VALUES (NULL, 0, 1, 2)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 3, 3)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 5, 4)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 1, 6)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 3, 8)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 5, 10)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 1, 8)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 3, 4)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 5, 3)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 1, 10)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 3, 8)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 5, 9)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 1, 4)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 3, 7)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 5, 9)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 1, 1)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 3, 2)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 5, 6)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 1, 3)
insert into [Order] ([end_date], [total], [manager_id], [customer_id])  VALUES (NULL, 0, 3, 9)

insert into [Status] VALUES ('Ожидает доставки деталей')
insert into [Status] VALUES ('Готов')
insert into [Status] VALUES ('Выполняется')
insert into [Status] VALUES ('В обработке')
insert into [Status] VALUES ('Будет готов к вечеру')
insert into [Status] VALUES ('Просрочен')
insert into [Status] VALUES ('Отменен')

insert into [Car] VALUES ('А111АА', 1, 1000, 3, '-', 1990, 1)
insert into [Car] VALUES ('Е100ЕЕ', 2, 200, 3, '-', 1997, 2)
insert into [Car] VALUES ('А123ПР', 3, 300, 3, '-', 2007, 3)
insert into [Car] VALUES ('А395РР', 4, 400, 3, '-', 2006, 4)
insert into [Car] VALUES ('Е895АА', 5, 500, 3, '-', 2017, 5)
insert into [Car] VALUES ('О395ЛД', 6, 6000, 3, '-', 2000, 6)
insert into [Car] VALUES ('З230ЩЗ', 7, 1100, 3, '-', 2010, 7)
insert into [Car] VALUES ('Л987ОХ', 8, 1200, 3, '-', 2014, 8)
insert into [Car] VALUES ('Г873ОН', 9, 12340, 3, '-', 2013, 9)
insert into [Car] VALUES ('М829ГУ', 10, 1234, 3, '-', 2012, 10)
insert into [Car] VALUES ('Т968ГР', 1, 38957, 3, '-', 1995, 11)
insert into [Car] VALUES ('К529ПЛ', 1, 1000, 3, '-', 2005, 12)
insert into [Car] VALUES ('Х475ШГ', 2, 200, 3, '-', 2017, 13)
insert into [Car] VALUES ('Г896ТТ', 3, 300, 3, '-', 2016, 14)
insert into [Car] VALUES ('Г867ИТ', 4, 400, 3, '-', 2014, 14)
insert into [Car] VALUES ('К738НГ', 5, 500, 3, '-', 2013, 15)
insert into [Car] VALUES ('О398ЛУ', 6, 6000, 3, '-', 2012, 16)
insert into [Car] VALUES ('О938АГ', 7, 1100, 3, '-', 2011, 17)
insert into [Car] VALUES ('П930ПР', 8, 1200, 3, '-', 2014, 18)
insert into [Car] VALUES ('Л846КЗ', 9, 12340, 3, '-', 2010, 19)
insert into [Car] VALUES ('П834ЫВ', 10, 1234, 3, '-', 2011, 20)
insert into [Car] VALUES ('Ы888ЫЫ', 1, 38957, 3, '-', 2007, 10)

insert into [Operation] VALUES (6, 2, 9, 3, 1, 50, '12/12/1997', '12/1/1998')
insert into [Operation] VALUES (4, 2, 2, 3, 2, 1500, '12/12/1997', '12/1/1998')
insert into [Operation] VALUES (6, 3, 3, 8, 3, 520, '12/9/2017', NULL)
insert into [Operation] VALUES (2, 2, 4, 2, 4, 850, '15/10/2017', NULL)
insert into [Operation] VALUES (4, 4, 5, 7, 5, 650, '12/1/2017', '12/1/2017')
insert into [Operation] VALUES (6, 2, 6, 4, 6, 560, '9/8/1997', '9/9/1998')
insert into [Operation] VALUES (2, 6, 13,3, 7, 550, '12/3/2010', '12/12/2010')
insert into [Operation] VALUES (4, 1, 8, 4, 8, 800, '12/9/2013', '12/12/2013')
insert into [Operation] VALUES (6, 2, 9,3, 9, 10, '12/10/2015', '12/12/2015')
insert into [Operation] VALUES (2, 3, 10, 2, 10, 570, '12/11/2008', '12/12/2008')
insert into [Operation] VALUES (4, 3, 1, 3, 11, 500, '10/6/2017', NULL)
insert into [Operation] VALUES (6, 1, 12, 3, 12, 100, '12/12/2017', '12/1/2017')
insert into [Operation] VALUES (2, 2, 13, 8, 13, 5200, '12/12/2017', NULL)
insert into [Operation] VALUES (4, 4, 14, 2, 14, 8505, '15/10/2016', '20/10/2016')
insert into [Operation] VALUES (6, 2, 15, 7, 15, 6520, '26/12/2017', NULL)
insert into [Operation] VALUES (2, 1, 5, 4, 16, 4560, '9/8/2017', '9/9/2017')
insert into [Operation] VALUES (4, 1, 5,3,  17, 2340, '12/3/2017', '10/9/2017')
insert into [Operation] VALUES (6, 1, 5, 4, 18, 6530, '24/11/2017', NULL)
insert into [Operation] VALUES (2, 3, 18,3,  19, 325, '12/10/2017', '12/10/2017')
insert into [Operation] VALUES (4, 3, 10, 2,  20, 2356, '12/11/2017', '12/10/2017')

insert into [Details] VALUES ('Колесо Маленькое')
insert into [Details] VALUES ('Колесо Большое')
insert into [Details] VALUES ('Двигатель Максима')
insert into [Details] VALUES ('Двигатель Уровень')
insert into [Details] VALUES ('Краска Люкс')
insert into [Details] VALUES ('Стекло Гласс')
insert into [Details] VALUES ('Свеча Кит.')
insert into [Details] VALUES ('Свеча Гер.')
insert into [Details] VALUES ('Покрышка Зимняя')
insert into [Details] VALUES ('Покрышка Летняя')

insert into [Transactions] VALUES (2,7,5, 10)
insert into [Transactions] VALUES (5,5,2, 15)
insert into [Transactions] VALUES (2,7,4, 100)
insert into [Transactions] VALUES (9,2,6, 20)
insert into [Transactions] VALUES (5,6,2, 40)
insert into [Transactions] VALUES (9,2,6, 70)
insert into [Transactions] VALUES (4,6,8, 10)
insert into [Transactions] VALUES (9,2,1, 113)
insert into [Transactions] VALUES (2,5,1, 1234)
insert into [Transactions] VALUES (7,2,1, 1234)
insert into [Transactions] VALUES (4,6,1, 345)
insert into [Transactions] VALUES (10,2,1, 1456)
insert into [Transactions] VALUES (7,6,1, 1346)
insert into [Transactions] VALUES (8,2,6, 146)
insert into [Transactions] VALUES (3,8,7, 14)
insert into [Transactions] VALUES (4,2,3, 1546)
insert into [Transactions] VALUES (7,7,2, 146)
insert into [Transactions] VALUES (5,3,9, 1645)
insert into [Transactions] VALUES (7,3,5, 1456)
insert into [Transactions] VALUES (2,6,4, 1456)
insert into [Transactions] VALUES (8,8,9, 187)

update [order]
set [order].total = totals_by_id.[total]
from 
[order]
inner join
(
	select [order].order_id, detail_totals.[sum] + work_totals.[sum] as [total]
	from [order] 
	inner join
	(
		select order_id, sum(amount * unit_price) as [sum]
		from transactions
		group by order_id
	) as detail_totals
	on detail_totals.order_id = [order].order_id
	inner join 
	(
		select order_id, sum(iterations * unit_price) as [sum]
		from Operation
		group by order_id
	) as work_totals
	on work_totals.order_id = [order].order_id
) as totals_by_id
on totals_by_id.order_id = [order].order_id

update [order] 
set [order].end_date = aux.end_date
from 
[order]
inner join
( 
	select [order].order_id, date_table.end_date
	from 
	[order]
	inner join
	(
		select order_id, max(actual_end_date) as end_date
		from operation
		group by order_id
	) date_table
	on [order].order_id = date_table.order_id
) aux
on [order].order_id = aux.order_id

update [order] 
set [start_date] = ISNULL(CAST(STR(10000 * YEAR([end_date]) + 100 * MONTH([end_date]) + DAY([end_date]) - DAY(1)) AS DATE), getdate())
where [order_id] < 5

update [order] 
set [start_date] = ISNULL(CAST(STR(10000 * YEAR([end_date]) + 100 * MONTH([end_date]) + DAY([end_date]) - DAY(3)) AS DATE), getdate())
where [order_id] < 10 and [order_id] >= 5

update [order] 
set [start_date] = ISNULL(CAST(STR(10000 * YEAR([end_date]) + 100 * MONTH([end_date]) + DAY([end_date]) - DAY(4)) AS DATE), getdate())
where [order_id] < 20 and [order_id] >= 10

update [order] 
set [start_date] = ISNULL(CAST(STR(10000 * YEAR([end_date]) + 100 * MONTH([end_date]) + DAY([end_date]) - DAY(7)) AS DATE), getdate())
where [order_id] >=20

