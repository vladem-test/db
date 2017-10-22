-- Все месяцы, в которые что-то происходило
insert into [Time]
	SELECT MONTH([start_date]), YEAR([start_date]) 
	FROM [Order]
	GROUP BY MONTH([start_date]), YEAR([start_date])  
	ORDER BY MAX([start_date])

-- Временная статистика с Годом и месяцем, вместо id
create table #StatByMonthYear ([Month] int, [Year] int, service_type_id int, manufacturer_id int, [count] int, [sum] money) 

insert into #StatByMonthYear
select 
MONTH([start_date]) as [Month], 
YEAR([start_date]) as [Year],
service_type_id, 
manufacturer.manufacturer_id, 
count(service_type_id) as [count], 
sum(iterations * unit_price) as [sum]
from [Operation]
join [Order]
	on [Operation].order_id = [Order].order_id
join [Car]
	on [Operation].car_id = Car.car_id
join Model
	on Model.model_code = car.model_code
join Manufacturer 
	on Manufacturer.manufacturer_id = Model.manufacturer_id 
group by MONTH([start_date]), YEAR([start_date]), service_type_id, Manufacturer.manufacturer_id

-- Столбец времен для итоговой статистики
create table #Time (id int IDENTITY(1,1), time_id int)

insert into #Time
select [Time].time_id
from [Time]
join #StatByMonthYear
on [Time].[month_id] = #StatByMonthYear.[Month] AND [Time].[year] =  #StatByMonthYear.[Year]
order by #StatByMonthYear.[Year], #StatByMonthYear.[Month]

-- Вставляем статистику в итогувую
insert into Fact (service_id, model_id, [count], [sum])
select service_type_id, manufacturer_id, [count], [sum]
from #StatByMonthYear
group by service_type_id, manufacturer_id, [count], [sum]
order by MAX(#StatByMonthYear.[Year]), MAX(#StatByMonthYear.[Month])

-- Вставляем id нужного месяца
update Fact
set Fact.time_id = [#Time].time_id
from #Time
where [#Time].id = Fact.fact_id

/*
select * from Fact
select * from #time
select * from [Time]
*/