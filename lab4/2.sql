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