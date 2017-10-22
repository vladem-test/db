IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'MechanicMonthStat' AND
	schema_id = SCHEMA_ID('dbo'))
DROP VIEW MechanicMonthStat
GO

CREATE VIEW MechanicMonthStat AS (
	select 
	first_name,
	last_name,
	sum(iterations * unit_price) as [Total Money],
	sum(datediff(dd,[start_date], isnull(operation.actual_end_date, getdate()))) as [Total Time Worked]
	from Employee
	join Job
		on Employee.job_id = Job.job_id
	join Operation
		on Employee.employee_id = Operation.mechanic_id
	join [Order] ordr
		on ordr.order_id = Operation.order_id
	where post = 'Механик' and [start_date] >= dateadd(m, -1, getdate())
	group by Employee.employee_id, last_name, first_name
)
go

select * from MechanicMonthStat

--https://stackoverflow.com/questions/22790678/sum-of-working-days-with-date-ranges-from-multiple-records-overlapping