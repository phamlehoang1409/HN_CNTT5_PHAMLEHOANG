use session7;
create table Department(
	dept_id int primary key auto_increment not null,
	dept_name varchar(255) not null,
	location varchar(100) not null

) ;
create table Employee (
	emp_id int primary key auto_increment not null,
	emp_name varchar(200) not null,
	gender int default 1,
	birth_date date,
	salary decimal(10,2),
	dept_id int ,
	FOREIGN KEY Department(dept_id) references  Department(dept_id)
	on update cascade
);

create table Project(
	project_id int primary key auto_increment,
	project_name varchar(50) not null,
	emp_id int ,
	start_date date,
	end_date date,
	foreign key (emp_id) references Employee(emp_id)
);

	alter table Employee
	add email varchar(100) unique;

	alter table Project
	modify project_name varchar(200);

	alter table Project 
	add constraint check_date
	check (end_date >= start_date);

	insert into Department(dept_name,location)
	values('IT','Ha Noi'),
	('HR','HCM'),
	('Marketing','Da Nang');

	insert into Employee (emp_id, emp_name, gender, birth_date, salary, dept_id, email) 
	VALUES
	(1, 'Nguyen Van A', 1, '1990-01-15', 1500, 1, 'a@gmail.com'),
	(2, 'Tran Thi B', 0, '1995-05-20', 1200, 1, 'b@gmail.com'),
	(3, 'Le Minh C', 1, '1988-10-10', 2000, 2, 'c@gmail.com'),
	(4, 'Pham Thi D', 0, '1992-12-05', 1800, 3, 'd@gmail.com');

	insert into Project (project_id, project_name, emp_id, start_date, end_date) 
	VALUES
	(101, 'Website Redesign', 1, '2024-01-01', '2024-06-01'),
	(102, 'Recruitment System', 3, '2024-02-01', '2024-08-01'),
	(103, 'Marketing Campaign', 4, '2024-03-01', null);

	update Employee
	set salary = salary + 200 
	where dept_id = 1;

	update Project
	set end_date = '2024-12-31'
	where end_date is null;

	delete from Project 
	where start_date < '2024-02-01';
    
    SELECT 
    emp_name,
    email,
    CASE 
        WHEN gender = 1 THEN 'Nam'
        WHEN gender = 0 THEN 'Nữ'
        ELSE 'Khác'
    END AS gender_name
FROM employees;







