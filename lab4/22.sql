-- ����� ��������� ��������� ���� ��������, ������� ��������� ������� �� ������� ������
select sum(unit_price * iterations) as Total
from Operation 
join Employee
	on employee_id = mechanic_id
join [Status]
	on operation_status = status_id
where (planned_end_date < GETDATE()) AND [status].[status] = '�����������' AND Employee.last_name = '������' 