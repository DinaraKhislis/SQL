/* cоздание таблицы salary1 cо столбцом monthly_salary */
create table salary1(
    id serial primary key,
    monthly_salary int not null
);

/* cоздание таблицы roles1 cо столбцом role_title */
create table roles1(
    id serial primary key,
    role_title varchar(30) unique not null
);

/* cоздание взаимосвязи таблиц roles1 и salary1 */
create table roles_salary1(
    id serial primary key,
    id_role int not null,
    id_salary int not null,
    foreign key (id_role)
        references roles1(id),
    foreign key (id_salary)    
        references salary1(id)
);
        
/* заполнение столбца role_title таблицы roles1 */
insert into roles1(role_title)
values ('QA_manual_junior'),
       ('QA_manual_middle'),
       ('QA_manual_senior'),
       ('QA_automation_junior'),
       ('QA_automation_middle'),
       ('QA_automation_senior'),
       ('Java_developer_junior'),
       ('Java_developer_middle'),
       ('Java_developer_senior'),
       ('CEO'),
       ('CTO'),
       ('HR'),
       ('Manager'),
       ('Designer');

/* заполнение столбца monthly_salary таблицы salary1 */
insert into salary1 (monthly_salary)
values (500),
       (700),
       (900),
       (1000),
       (1200),
       (1400),
       (1500),
       (1700),
       (2000);

/* удаление лишних строк в таблицах */
delete from roles;

/* заполнение таблицы roles_salary1 */
insert into roles_salary1(id_role, id_salary)
values (1, 1),
       (2, 3),
       (3, 7),
       (4, 1),
       (5, 5),
       (6, 8);


/* вызов просмотра таблицы */
select * from roles2
order by (id);

/* объединение таблиц с двумя джоинами */
select role_title, monthly_salary from roles_salary1
join salary1 on id_salary = salary1.id
join roles1 on id_role = roles1.id

/* cоздание доп. столбца parking в таблице roles1 */
alter table roles1 
add column parking int;

/* изменение наименования столбца на taxi */
alter table roles1 
rename column parking to taxi;

/* удаление столбца taxi */
alter table roles1 
drop column taxi

/* изменение значения столбца monthly_salary в таблице salary1 */
update salary1 
set monthly_salary = 1600
where id = 7;


/* SQL_DDL Таблица employees*/
create table employees(
    id serial primary key,
    employee_name varchar(50) unique not null
);

/* заполнение столбца employee_name таблицы employees 70 строками (переименован столбец) */
insert into employees(employee_name)
values ('Reggie Batey'), 
       ('Clara Poore'), 
       ('Tammy Galindo'), 
       ('Rickey Jones'), 
       ('Jill Anspach'), 
       ('Lacy Racicot'), 
       ('David Macias'), 
       ('Jessica Manns'), 
       ('Amber Holcomb'), 
       ('Betty Wells'), 
       ('Miguel Fletcher'), 
       ('Joseph Hodges'), 
       ('Ida Bohannon'), 
       ('Cindy Merrifield'), 
       ('Mary Dowell'), 
       ('Marie Thomas'), 
       ('Donald Fierro'), 
       ('Anna Wick'), 
       ('Robert Harian'), 
       ('Michael Mark'), 
       ('Lucius Patterson'), 
       ('Lorna Rose'), 
       ('Karen Santiago'), 
       ('Peggy Beachler'), 
       ('Chester Baird'), 
       ('Ronda Colley'), 
       ('Robert Chapman'), 
       ('Sandra Hibbard'), 
       ('Steven Pagano'), 
       ('Ramona Russell'),  
       ('Ryan Morgan'), 
       ('Shannon Daugherty'), 
       ('Charlene Little'), 
       ('Steve Lewandowski'), 
       ('Donnie Shoemaker'), 
       ('Veronica Treto'), 
       ('Jonathon Belanger'), 
       ('William Hughes'), 
       ('Courtney Alston'), 
       ('Isaac Walters'), 
       ('Leon Ashcraft'), 
       ('Daniel Patterson'), 
       ('Randall Phillips'), 
       ('James Williams'), 
       ('Nancy Searles'), 
       ('Edward Hilliard'), 
       ('Joel Vandevelde'), 
       ('Nancy Bravo'), 
       ('Jesse Clark'), 
       ('Gregory Magelssen'), 
       ('Ella Cortez'), 
       ('Michael Diaz'), 
       ('Robert Walsh'), 
       ('Valorie Seibert'), 
       ('Yoshiko Miller'), 
       ('Timothy Johnson'), 
       ('Lita Webb'), 
       ('Lindsay Barrera'), 
       ('Jacqulyn Matthews'), 
       ('Lee Rehart'), 
       ('Fred Spencer'), 
       ('Melinda Webster'), 
       ('Shawn Pretti'), 
       ('Betty Schaefer'), 
       ('Barbara Teets'), 
       ('Patricia Tomas'), 
       ('Mattie Kelley'), 
       ('Mary Yates'), 
       ('Andrea Croes'), 
       ('Amanda Riley');
       
/* cоздание таблицы salary2 cо столбцом monthly_salary2 */
create table salary2(
    id serial primary key,
    monthly_salary2 int not null
);

/* заполнение столбца monthly_salary таблицы salary2 (переименован столбец) */
insert into salary2 (monthly_salary2)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);
       
/* cоздание таблицы employee_salary cо столбцом employee_id и salary2_id */
create table employee_salary(
    id serial primary key,
    employee_id int unique not null,
    salary2_id int not null
    );
    
/* заполнение таблицы employee_salary */
insert into employee_salary(employee_id, salary2_id)
values (3, 7),
       (1, 4),
       (5, 9),
       (40, 13),
       (23, 4),
       (11, 2),
       (52, 10),
       (15, 13),
       (26, 4),
       (16, 1),
       (33, 7),
       (2, 5),
       (6, 11),
       (7, 11),
       (31, 6),
       (42, 15),
       (21, 8),
       (10, 2),
       (50, 16),
       (39, 8),
       (20, 2),
       (19, 9),
       (61, 3),
       (8, 4),
       (67, 2),
       (9, 13),
       (4, 6),
       (48, 13),
       (25, 16),
       (55, 14),
       (71, 7),
       (72, 8),
       (73, 9),
       (74, 2),
       (75, 1),
       (76, 3),
       (77, 4),
       (78, 5),
       (79, 6),
       (80, 7);
      
/* cоздание таблицы roles2 cо столбцом roles2_name */
create table roles2(
    id serial primary key,
    roles2_name int unique not null
    );      
   
/* удаление таблицы roles */
drop table roles2;

/* изменение типа столба roles2_name в таблице roles2 */
alter table roles2
alter column roles2_name type varchar(30);

/* заполнение таблицы roles2 */
insert into roles2(roles2_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer'); 
      
/* cоздание таблицы roles2_employee cо столбцом employee_id и role2_id */
create table roles2_employee(
    id serial primary key,
    employee_id int unique not null,
    role2_id int not null
    );      
      
/* заполнение таблицы roles2_employee */
insert into roles2_employee(employee_id, role2_id)
values (7, 2),
       (20, 4),
       (3, 9),
       (5, 13),
       (23, 4),
       (19, 2),
       (10, 9),
       (22, 13),
       (21, 3),
       (34, 4),
       (6, 7),
       (68, 16),
       (1, 5),
       (24, 19),
       (31, 15),
       (8, 12),
       (17, 20),
       (28, 9),
       (38, 14),
       (26, 16),
       (45, 1),
       (43, 13),
       (2, 6),
       (9, 20),
       (12, 18),
       (51, 4),
       (41, 13),
       (60, 8),
       (66, 17),
       (14, 5),
       (33, 15),
       (55, 5),
       (25, 1),
       (16, 6),
       (44, 9),
       (11, 14),
       (27, 17),
       (56, 18),
       (62, 5),
       (70, 4);
       
