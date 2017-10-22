--  аждому заказу присвоить итоговую стоимость равную суммарной стоимости всех деталей и работ
update [order]
set [order].total = totals_by_id.[total]
from 
[order]
inner join
(
	select [order].order_id, detail_totals.[sum] + work_totals.[sum] as [total]
	from [order] 
	inner join
	(
		select order_id, sum(amount * unit_price) as [sum]
		from transactions
		group by order_id
	) as detail_totals
	on detail_totals.order_id = [order].order_id
	inner join 
	(
		select order_id, sum(iterations * unit_price) as [sum]
		from Operation
		group by order_id
	) as work_totals
	on work_totals.order_id = [order].order_id
) as totals_by_id
on totals_by_id.order_id = [order].order_id
