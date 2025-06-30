use coursehub;
-- Table: trainer
CREATE TABLE trainer (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    t_name VARCHAR(100) NOT NULL,
    expertise VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5),
	YOE INT CHECK (YOE >= 2)
);
-- Table: course
CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(100) NOT NULL,
    fees DECIMAL(10,2) NOT NULL CHECK (fees >= 50000),
    mode_of_learning ENUM('Online', 'Offline') DEFAULT 'Online'
);
-- Table: learner
CREATE TABLE learner (
    learner_id INT PRIMARY KEY AUTO_INCREMENT,
    l_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    score DECIMAL(5,2) CHECK (score BETWEEN 25 AND 100),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id));

-- INNER JOIN
-- Learners with their corresponding course and trainer details
SELECT 
    l.l_name, l.email, c.c_name, t.t_name, t.expertise
FROM 
    learner l
INNER JOIN course c ON l.course_id = c.course_id
INNER JOIN trainer t ON l.trainer_id = t.trainer_id;

-- LEFT JOIN
-- All learners and their course/trainer details (if assigned)
SELECT 
    l.l_name, l.email, c.c_name, t.t_name
FROM 
    learner l
LEFT JOIN course c ON l.course_id = c.course_id
LEFT JOIN trainer t ON l.trainer_id = t.trainer_id;

-- RIGTH JOIN
-- All courses and the learners enrolled in them
SELECT 
    c.c_name, l.l_name, l.email
FROM 
    learner l
RIGHT JOIN course c ON l.course_id = c.course_id;

--  FULL OUTER JOIN
-- All learners and courses, even if not linked
SELECT 
    l.l_name, l.email, c.c_name
FROM 
    learner l
LEFT JOIN course c ON l.course_id = c.course_id
UNION
SELECT 
    l.l_name, l.email, c.c_name
FROM 
    learner l
RIGHT JOIN course c ON l.course_id = c.course_id;

-- Find trainers who have not been assigned to any learner yet
SELECT 
    t.trainer_id, t.t_name, t.expertise
FROM 
    trainer t
LEFT JOIN learner l ON t.trainer_id = l.trainer_id
WHERE 
    l.trainer_id IS NULL;

-- Get average learner scores grouped by course and trainer
SELECT 
    c.c_name AS Course_Name,
    t.t_name AS Trainer_Name,
    AVG(l.score) AS Average_Score
FROM 
    learner l
INNER JOIN course c ON l.course_id = c.course_id
INNER JOIN trainer t ON l.trainer_id = t.trainer_id
GROUP BY 
    c.c_name, t.t_name;


