-- Удалить записи о заказах, законченные больше 5 лет назад

delete 
from Transactions
where order_id in 
(
	select order_id
	from [Order]
	where DATEDIFF(year, ISNULL(end_date, getdate()), getdate()) >= 5)

delete 
from Operation
where order_id in 
(
	select order_id
	from [Order]
	where DATEDIFF(year, ISNULL(end_date, getdate()), getdate()) >= 5)

delete 
from [Order]
where order_id in 
(
	select order_id
	from [Order]
	where DATEDIFF(year, ISNULL(end_date, getdate()), getdate()) >= 5)