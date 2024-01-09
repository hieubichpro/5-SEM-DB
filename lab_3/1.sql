create or replace function total_salary(work_experience int, salary int)
returns int as
$$
begin
	return work_experience * salary;
end;
$$
language plpgsql;

--Функция вычисления зарплаты тренеров за количество лет они работают
select id_coach, first_name, work_experience, salary, total_salary(work_experience, salary)
from fb.coach