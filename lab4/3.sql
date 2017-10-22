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