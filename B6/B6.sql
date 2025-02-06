-- Sử dụng lại CSDL ss6 để thực hành lại bài này 
USE ss6;

-- Tạo bảng employees
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL,            
    position VARCHAR(50) NOT NULL,              
    salary DECIMAL(10, 2) NOT NULL,             
    hire_date DATE NOT NULL,                    
    department VARCHAR(50) NOT NULL            
);

-- Thêm bản ghi vào employees
INSERT INTO employees (full_name, position, salary, hire_date, department)
VALUES
('Nguyen Van An', 'Software Engineer', 15000000.00, '2022-05-01', 'IT'),
('Tran Thi Bich', 'HR Specialist', 12000000.00, '2021-03-15', 'Human Resources'),
('Le Van Cuong', 'Sales Manager', 18000000.00, '2020-11-20', 'Sales'),
('Pham Minh Hoang', 'Marketing Specialist', 14000000.00, '2023-01-10', 'Marketing'),
('Do Thi Ha', 'Accountant', 13000000.00, '2021-07-25', 'Finance'),
('Hoang Quang Huy', 'Project Manager', 20000000.00, '2019-06-05', 'IT');

select e.full_name, e.position,e.salary 
from employees e where e.salary > (select avg(salary) from employees);

select e.full_name, e.department
from employees e
where e.department in (
    select department 
    from employees 
    group by department
    having count(*) >= 2
);


select e.full_name, e.department, e.salary
from employees e where e.salary = (select max(salary) from employees where department = e.department);


select e.full_name, e.department, e.hire_date
from employees e where e.hire_date = (select min(hire_date) from employees where department = e.department);

