IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'CustomerOrder1' AND
		schema_id = SCHEMA_ID('dbo'))
DROP VIEW CustomerOrder1
GO

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'CustomerOrder2' AND
		schema_id = SCHEMA_ID('dbo'))
DROP VIEW CustomerOrder2
GO

CREATE VIEW CustomerOrder1 AS
(
	select 
		--ordr.order_id,
		Customer.last_name as 'Customers Last Name',
		Customer.first_name as 'Customers First Name',
		isnull(Manufacturer.manufacturer_name, '-') as Manufacturer,
		isnull(Car.realese_year, '-') as 'Car Release Year',
		isnull(ordr.total, 0) as 'Order Total',
		isnull([Employee].first_name, '-') as 'Mechanic' 
	from Customer
	left join [Order] ordr
		on ordr.customer_id = Customer.customer_id
	left join [Operation]
		on ordr.order_id = [Operation].order_id
	left join [Employee]
		on [Employee].employee_id = mechanic_id
	left join [Car] 
		on [Operation].car_id = [Car].car_id
	left join [Model]
		on [Model].model_code = [Car].model_code
	left join [Manufacturer]
		on [Manufacturer].manufacturer_id = [Model].manufacturer_id 
)
go

CREATE VIEW CustomerOrder2 AS
(
	select 
		--ordr.order_id,
		last_name as 'Customers Last Name',
		first_name as 'Customers First Name',
		isnull((
			select distinct manufacturer_name + ', '
			from Operation
			join Car
				on Car.car_id = Operation.car_id
			join [Model]
				on [Model].model_code = [Car].model_code
			join [Manufacturer]
				on [Manufacturer].manufacturer_id = [Model].manufacturer_id 
			where Operation.order_id =  ordr.order_id
			for xml path('')
		), '') as 'Cars',
		isnull((
			select distinct convert(nvarchar(50), realese_year) + ', '
			from Operation
			join Car
				on Car.car_id = Operation.car_id
			where Operation.order_id =  ordr.order_id
			for xml path('')
		),'') as 'Cars Release Years',
		isnull(ordr.total,0) as 'Order Total',
		isnull((
			select distinct first_name + ', '
			from Operation
			join Employee
				on Employee.employee_id = Operation.mechanic_id
			where Operation.order_id =  ordr.order_id
			for xml path('')
		),'') as 'Mechanics' 
	from Customer
	left join [Order] ordr
		on ordr.customer_id = Customer.customer_id
)
go

select * from CustomerOrder2
order by [Customers Last Name], [Customers First Name]