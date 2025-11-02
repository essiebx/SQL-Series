-- JOIN Operations Practice
-- File: joins_practice.sql

-- Create courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    instructor TEXT,
    credits INTEGER
);

-- Create enrollment table
CREATE TABLE IF NOT EXISTS enrollment (
    student_id INTEGER,
    course_id INTEGER,
    grade TEXT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert course data
INSERT INTO courses (course_name, instructor, credits) VALUES
('Data Structures', 'Dr. Smith', 3),
('Calculus I', 'Dr. Johnson', 4),
('Introduction to Biology', 'Dr. Brown', 3);

-- Insert enrollment data
INSERT INTO enrollment VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 3, 'A'),
(3, 1, 'A');

-- Practice JOIN queries
-- Inner Join: Students and their courses
SELECT 
    s.name as student_name,
    c.course_name,
    e.grade
FROM students s
JOIN enrollment e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- Left Join: All students with their enrollments
SELECT 
    s.name as student_name,
    c.course_name,
    e.grade
FROM students s
LEFT JOIN enrollment e ON s.id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;