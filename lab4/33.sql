-- Выбрать модель машины, которая ломается чаще всего за последние 5 лет

select TOP(1) WITH TIES manufacturer_name
from Car
join 
(
	select car_id
	from [Order]
	join
	(
		select Operation.car_id, [Order].order_id
		from Car 
		join Operation 
			on Operation.car_id = Car.car_id
		join [Order]
			on Operation.order_id = [Order].order_id
		join [ServiceType]
			on Operation.service_type_id = ServiceType.service_type_id
		where [service_name] NOT IN ('Покраска', 'Тонирование', 'Чистка салона', 'Полировка', 'Тех. осмотр')
		group by Operation.car_id, [Order].order_id
	) as OrderCarRepaired on OrderCarRepaired.order_id = [Order].order_id
	where YEAR([start_date]) >= YEAR(getdate()) - 5
) as CarList on CarList.car_id = Car.car_id 
join Model on Car.model_code = Model.model_code
join Manufacturer on Manufacturer.manufacturer_id = Model.manufacturer_id
group by Manufacturer.manufacturer_id, manufacturer_name
order by count(*) desc
select * from ServiceType