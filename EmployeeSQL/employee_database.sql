-- Create departments table
CREATE TABLE IF NOT EXISTS departments (
    dept_no TEXT PRIMARY KEY,
    dept_name TEXT NOT NULL
);

-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    emp_no INTEGER PRIMARY KEY,
    birth_date TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    hire_date TEXT NOT NULL
);

-- Create dept_emp table
CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no INTEGER,
    dept_no TEXT,
    from_date TEXT NOT NULL,
    to_date TEXT NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept_manager table
CREATE TABLE IF NOT EXISTS dept_manager (
    emp_no INTEGER,
    dept_no TEXT,
    from_date TEXT NOT NULL,
    to_date TEXT NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create salaries table
CREATE TABLE IF NOT EXISTS salaries (
    emp_no INTEGER,
    salary INTEGER NOT NULL,
    from_date TEXT NOT NULL,
    to_date TEXT NOT NULL,
    PRIMARY KEY (emp_no, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create titles table
CREATE TABLE IF NOT EXISTS titles (
    emp_no INTEGER,
    title TEXT NOT NULL,
    from_date TEXT NOT NULL,
    to_date TEXT NOT NULL,
    PRIMARY KEY (emp_no, title, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

