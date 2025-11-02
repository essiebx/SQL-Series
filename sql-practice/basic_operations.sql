-- Basic SQL Operations Practice
-- File: basic_operations.sql

-- 1. Create students table
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    major TEXT,
    gpa REAL
);

-- 2. Insert sample data
INSERT INTO students (name, age, major, gpa) VALUES
('Alice Johnson', 20, 'Computer Science', 3.8),
('Bob Smith', 22, 'Mathematics', 3.5),
('Carol Davis', 21, 'Physics', 3.9),
('David Wilson', 19, 'Biology', 3.2);

-- 3. Basic SELECT queries
-- Select all students
SELECT * FROM students;

-- Select students with GPA > 3.5
SELECT name, major, gpa 
FROM students 
WHERE gpa > 3.5 
ORDER BY gpa DESC;
-- 1. Find all Computer Science students
SELECT * FROM students WHERE major = 'Computer Science';

-- 2. Count students by major
SELECT major, COUNT(*) as student_count 
FROM students 
GROUP BY major;

-- 3. Find students with A grades
SELECT s.name, c.course_name, e.grade
FROM students s
JOIN enrollment e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';

-- 4. Update a record
UPDATE students SET gpa = 4.0 WHERE name = 'Carol Davis';

-- 5. See the update
SELECT * FROM students WHERE name = 'Carol Davis';

-- 4. Aggregation
SELECT 
    COUNT(*) as total_students,
    AVG(gpa) as average_gpa,
    MAX(gpa) as highest_gpa,
    MIN(gpa) as lowest_gpa
FROM students;