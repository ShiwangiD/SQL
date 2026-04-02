create table students(s_id  SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL);

INSERT INTO students (name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('David');

CREATE TABLE courses(
c_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
fee NUMERIC NOT NULL
);

INSERT INTO courses (name, fee) VALUES
('Mathematics', 5000),
('Science', 4500),
('English', 4000),
('History', 3500);

CREATE TABLE enrollment(
enrollment_id SERIAL PRIMARY KEY,
s_id INT NOT NULL,
c_id INT NOT NULL,
enrollment_date DATE NOT NULL,
FOREIGN KEY(s_id) REFERENCES students(s_id),
FOREIGN KEY (c_id) REFERENCES courses(c_id)
);

INSERT INTO enrollment (s_id, c_id, enrollment_date) VALUES
(1, 1, '2026-04-01'),  -- Alice enrolled in Mathematics
(1, 2, '2026-04-02'),  -- Alice enrolled in Science
(2, 1, '2026-04-03'),  -- Bob enrolled in Mathematics
(3, 3, '2026-04-04'),  -- Charlie enrolled in English
(4, 4, '2026-04-05');  -- David enrolled in History


select * from students;
select * from coureses;
select * from enrollment;


SELECT s.name, c.name,e.enrollment_date, c.fee
FROM enrollment e
JOIN students s ON e.s_id = s.s_id
JOIN courses c ON c.c_id = e.c_id;