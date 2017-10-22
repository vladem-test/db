IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'TimesCarStayedLong' AND
	schema_id = SCHEMA_ID('dbo'))
DROP VIEW TimesCarStayedLong
GO

CREATE VIEW TimesCarStayedLong AS (
	select
	OrderIDCarStayedLong.manufacturer_name as 'Manufacturer',
	count(*) as 'Times Cars Statyed More Then One Day'
	from (
		select 
		manufacturer_name, ordr.[order_id]
		from Car
		left join Operation
			on Operation.car_id = Car.car_id
		left join [Order] ordr 
			on Operation.order_id = ordr.order_id
		join Model 
			on Car.model_code = Model.model_code
		join Manufacturer
			on Model.manufacturer_id = Manufacturer.manufacturer_id
		group by manufacturer_name, ordr.[order_id] 
		having DATEDIFF(dd, min([start_date]), max(isnull([end_date],getdate()))) > 1
	) as OrderIDCarStayedLong group by OrderIDCarStayedLong.manufacturer_name
) 
GO

select * from TimesCarStayedLong