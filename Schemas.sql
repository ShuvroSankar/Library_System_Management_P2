--Libarary Managment System Project

-- Creating branch table
DROP TABLE IF EXISTS BRANCH;
Create Table branch(
	branch_id VARCHAR(100) PRIMARY KEY,
	manager_id VARCHAR(100),
	branch_address VARCHAR(100),
	contact_no VARCHAR(20)
	);

DROP TABLE IF EXISTS employees;
Create Table employees(
	emp_id VARCHAR(100) PRIMARY KEY,
	emp_name VARCHAR(100),
	position VARCHAR(105),
	salary FLOAT,
	branch_id VARCHAR(105) --FK
	);

DROP TABLE IF EXISTS books;
Create Table books(
	isbn VARCHAR(100) PRIMARY KEY,
	book_title VARCHAR(105),
	category VARCHAR(105),
	rental_price FLOAT,
	status VARCHAR(105),
	author VARCHAR(105),
	publisher VARCHAR(105)
	);
DROP TABLE IF EXISTS members;
Create Table members(
	member_id VARCHAR(100) PRIMARY KEY,
	member_name VARCHAR(105),
	member_address VARCHAR(105),
	reg_date DATE
	);

DROP TABLE IF EXISTS issued_status;
Create Table issued_status(
	issued_id VARCHAR(100) PRIMARY KEY,
	issued_member_id VARCHAR(100), --FK
	issued_book_name VARCHAR(105),
	issued_date DATE ,
	issued_book_isbn VARCHAR(105), --FK
	issued_emp_id VARCHAR(100) --FK
);

DROP TABLE IF EXISTS return_status;
Create Table return_status(
	return_id VARCHAR(100) PRIMARY KEY,
	issued_id VARCHAR(100), --FK
	return_book_name VARCHAR(100),
	return_date DATE,
	return_book_id VARCHAR(100)
);

--FOREIGN KEY

ALTER TABLE issued_status
DROP CONSTRAINT fk_members;

ALTER TABLE issued_status
DROP CONSTRAINT fk_books;

ALTER TABLE issued_status
DROP CONSTRAINT fk_employees;

ALTER TABLE return_status
DROP CONSTRAINT fk_issued

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employee
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);
 

