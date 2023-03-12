/* Вывести таблицу с работниками (без нумерации с айди) */
select employee_name
from employees;

/* Вывести таблицу с работниками с нумерацией айди) */
select * from salary2;

/* 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами */
select employees.employee_id, salary2.salary2_id
from employees
inner join employee_salary on employees.id=employee_salary.employee_id
inner join salary2 on employee_salary.salary2_id=salary2.id;

/* изменение наименования столбца на employee_id */
alter table employees
rename column employee_name to employee_id;

/* изменение наименования столбца на salary2_id */
alter table salary2
rename column monthly_salary2 to salary2_id;

/* 2. Вывести всех работников у которых ЗП меньше 2000 */
select employees.employee_id, salary2.salary2_id
from employees
inner join employee_salary on employees.id=employee_salary.employee_id
inner join salary2 on employee_salary.salary2_id=salary2.id
where salary2.salary2_id < 2000;

/* 3. Вывести все зарплатные позиции, но работник по ним не назначен (где на 10 ЗП выставлены несуществующие id работников) */
select salary2.salary2_id
from employee_salary
inner join salary2 on employee_salary.salary2_id=salary2.id
where employee_salary.employee_id > 70;

/* 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен.  */
select salary2.salary2_id
from employee_salary
left join salary2 on employee_salary.salary2_id=salary2.id
where employee_id > 70 and salary2.salary2_id < 2000;

/* 5. Найти всех работников кому не начислена ЗП.  */
select employees.employee_id, employee_salary.salary2_id
from employees
left join employee_salary on employees.id=employee_salary.employee_id
left join salary2 on employee_salary.salary2_id=salary2.id
where employee_salary.salary2_id is null;

/* 6. Вывести всех работников с названиями их должности. */
select employees.employee_id, roles2.roles2_name
from roles2_employee
inner join employees on roles2_employee.employee_id=employees.id
inner join roles2 on roles2_employee.role2_id=roles2.id;

/* 7. Вывести имена и должность только Java разработчиков. */
select employees.employee_id, roles2.roles2_name
from roles2_employee
inner join employees on roles2_employee.employee_id=employees.id
inner join roles2 on roles2_employee.role2_id=roles2.id
where roles2.roles2_name like ('%Java developer%');

/* 8-11 аналогичные запросы как в пункте 7. */

/* 12. Вывести имена и зарплаты Junior специалистов. */
select * from roles2
inner join roles2_employee on roles2.id=roles2_employee.role2_id
inner join employees on roles2_employee.employee_id=employees.id
inner join employee_salary on employees.id=employee_salary.employee_id
inner join salary2 on employee_salary.salary2_id=salary2.id
where roles2.roles2_name like ('%Junior%');

select employees.employee_id, salary2.salary2_id
from roles2
inner join roles2_employee on roles2.id=roles2_employee.role2_id
inner join employees on roles2_employee.employee_id=employees.id
inner join employee_salary on employees.id=employee_salary.employee_id
inner join salary2 on employee_salary.salary2_id=salary2.id
where roles2.roles2_name like ('%Junior%');

select * from employees

/* 13-14 b 17-19 аналогичные запросы как в пункте 12. */

/* 15. Вывести зарплаты Java разработчиков (16 и 20 аналогичные). */
select * from employee_salary
inner join salary2 on employee_salary.salary2_id=salary2.id
inner join roles2_employee on employee_salary.employee_id=roles2_employee.employee_id
where roles2_employee.role2_id = 4 or roles2_employee.role2_id = 5 or roles2_employee.role2_id = 6;

/* 21. Вывести среднюю зарплату всех Junior специалистов. */
select avg (salary2.salary2_id) from salary2
inner join employee_salary on salary2.id=employee_salary.salary2_id
inner join employees on employee_salary.employee_id=employees.id
inner join roles2_employee on employees.id=roles2_employee.employee_id
inner join roles2 on roles2_employee.role2_id=roles2.id
where roles2.roles2_name like ('%Junior%');

/* 22. Вывести сумму зарплат JS разработчиков (п.28 аналогичный) . */
select sum (salary2.salary2_id) from salary2
inner join employee_salary on salary2.id=employee_salary.salary2_id
inner join employees on employee_salary.employee_id=employees.id
inner join roles2_employee on employees.id=roles2_employee.employee_id
inner join roles2 on roles2_employee.role2_id=roles2.id
where roles2.roles2_name like ('%JavaScript%');

/* 23. Вывести минимальную ЗП QA инженеров. */
select min (salary2.salary2_id) from salary2
inner join employee_salary on salary2.id=employee_salary.salary2_id
inner join employees on employee_salary.employee_id=employees.id
inner join roles2_employee on employees.id=roles2_employee.employee_id
inner join roles2 on roles2_employee.role2_id=roles2.id
where roles2.roles2_name like ('%QA%');

/* 24. Вывести максимальную ЗП QA инженеров. */
select max (salary2.salary2_id) from salary2
inner join employee_salary on salary2.id=employee_salary.salary2_id
inner join employees on employee_salary.employee_id=employees.id
inner join roles2_employee on employees.id=roles2_employee.employee_id
inner join roles2 on roles2_employee.role2_id=roles2.id
where roles2.roles2_name like ('%QA%');

/* 25. Вывести количество QA инженеров (п. 26-27 аналогичный). */
select count (employees.employee_id) from employees
inner join roles2_employee on employees.id=roles2_employee.employee_id
inner join roles2 on roles2_employee.role2_id=roles2.id
where roles2.roles2_name like ('%QA%');

/* 29. Вывести имена, должности и ЗП всех специалистов по возрастанию. */
select employees.employee_id, roles2.roles2_name, salary2.salary2_id
from salary2
inner join employee_salary on salary2.id=employee_salary.salary2_id
inner join employees on employee_salary.employee_id=employees.id
inner join roles2_employee on employees.id=roles2_employee.employee_id
inner join roles2 on roles2_employee.role2_id=roles2.id
order by salary2.salary2_id;

/* 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300. */
select employees.employee_id, roles2.roles2_name, salary2.salary2_id
from salary2
inner join employee_salary on salary2.id=employee_salary.salary2_id
inner join employees on employee_salary.employee_id=employees.id
inner join roles2_employee on employees.id=roles2_employee.employee_id
inner join roles2 on roles2_employee.role2_id=roles2.id
where salary2.salary2_id between 1700 and 2300
order by salary2.salary2_id;
