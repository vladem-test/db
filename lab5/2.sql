IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'CustomerTotal' AND
		schema_id = SCHEMA_ID('dbo'))
DROP VIEW CustomerTotal
GO

CREATE VIEW CustomerTotal AS
(
	select 
	Customer.first_name as 'First Name',
	Customer.last_name as 'Last Name',
	isnull(
	(
		select distinct isnull(manufacturer_name,'') + ' '
		from Car
		join [Model]
			on [Model].model_code = [Car].model_code
		join [Manufacturer]
			on [Manufacturer].manufacturer_id = [Model].manufacturer_id 
		where Car.owner_id = Customer.customer_id
		for xml path('')
	),'-') as 'Cars',
	sum(isnull(total,0)) as 'Total Payment',
	sum(datediff(dd, isnull([start_date],getdate()), isnull([end_date],getdate()))) as 'Total Days Waiting'
	from Customer
	left join [Order]
		on [Order].customer_id = Customer.customer_id
	group by Customer.customer_id, first_name, last_name
)
go

select * from CustomerTotal

