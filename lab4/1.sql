--¬ыбрать фамилию того механика, который чаще всех работает с новыми автомобил€ми.
select top(1) WITH TIES last_name
from Operation
join Car
	on Operation.car_id = Car.car_id
join Employee
	on Operation.mechanic_id = Employee.employee_id
where realese_year = YEAR(getdate())
group by mechanic_id, last_name
order by count(*) DESC

-- ¬ыбрать фамилию хоз€ина, чаще всего посещающего мастерскую и имеющего автомобиль марки "ћерседес"
select top(1) WITH TIES last_name
from [Order]
join
(
	select distinct customer_id, last_name
	from Car
	join Customer
		on Car.owner_id = Customer.customer_id 
	join Model
		on Car.model_code = Model.model_code
	join Manufacturer
		on Model.manufacturer_id = Manufacturer.manufacturer_id
	where manufacturer_name = 'Mersedes'
) AS MersOwners
	on [Order].customer_id = MersOwners.customer_id
group by [MersOwners].customer_id, last_name
order by count(*) DESC

-- ќпределить тех владельцев автомобилей, которых всегда обслуживает один и тот же механик. ¬ывести фамилии механика и его посто€нного клиента.
select distinct 
Customer.last_name as Customer, 
Employee.last_name as Mechanic
from Operation
join Employee
	on mechanic_id = employee_id
join Car
	on Car.car_id = Operation.car_id
join Customer
	on customer_id = owner_id
where customer_id in (
	select owner_id
	from Car
	join Operation
		on Car.car_id = Operation.car_id
	group by car.owner_id
	having count(distinct mechanic_id) = 1
)