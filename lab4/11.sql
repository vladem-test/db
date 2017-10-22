-- Выбрать фамилии всех сотрудников, работающих в Москве
select last_name
from Employee
join Department
	on Employee.department = Department.department_id
join City
	on City.city_id = Department.city_id
where City.city = 'Moscow'