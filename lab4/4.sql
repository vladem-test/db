-- Для каждой марки автомобиля выбрать механика, чаще всего обслуживающего эту марку.
WITH MechanicManuf as
(
	select 
	Manufacturer.manufacturer_id, mechanic_id, manufacturer_name, last_name, count(*) as [count]
	from Operation
	join Employee
		on employee_id = mechanic_id
	join Car
		on Car.car_id = Operation.car_id
	join Model
		on Car.model_code = Model.model_code
	join Manufacturer
		on Model.manufacturer_id = Manufacturer.manufacturer_id
	group by Manufacturer.manufacturer_id, mechanic_id, manufacturer_name, last_name
)

select manufacturer_name, last_name 
from MechanicManuf
join
(
	select manufacturer_id, MAX([count]) as maxCount
	from MechanicManuf
	group by manufacturer_id
) as ManufMaxCount on ManufMaxCount.manufacturer_id = MechanicManuf.manufacturer_id AND ManufMaxCount.maxCount = MechanicManuf.[count]
order by MechanicManuf.manufacturer_id