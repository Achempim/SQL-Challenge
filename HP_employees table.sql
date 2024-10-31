-- Employees Table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1),
    hire_date DATE NOT NULL
);

-- Departments Table
CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) UNIQUE NOT NULL
);

-- Salaries Table
CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);

-- Titles Table
CREATE TABLE titles (
    emp_no INT,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
    PRIMARY KEY (emp_no, title, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);

-- Dept_Employee Table (Associates Employees with Departments)
CREATE TABLE dept_employee (
    emp_no INT,
    dept_no CHAR(4),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE
);

-- Dept_Manager Table (Tracks Department Managers)
CREATE TABLE dept_manager (
    dept_no CHAR(4),
    emp_no INT,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);
