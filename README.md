# TASK-5
#  CourseHub Database – SQL Join Practice Project

##  Database Design
The schema consists of three core tables:

## trainer
- Stores trainer info including name, area of expertise, experience, and rating
- Constraints ensure data validity (e.g., minimum experience and rating range)

## course
- Catalog of courses with pricing and mode of delivery
- Ensures minimum fee requirements and enforces online as default learning mode

## learner
- Learner profiles linked to both courses and trainers through foreign keys
- Tracks academic scores and ensures email uniqueness

##  Join Logic Overview
The core focus of this project is to retrieve meaningful insights using different join types:
 INNER JOIN:- to combine matched learners, courses, and trainers
 LEFT JOIN:-  to include all learners regardless of enrollment status
 RIGHT JOIN:- to list all courses even if no one’s enrolled
 FULL OUTER JOIN:- simulated with `UNION` to combine left + right join results
- Additional joins for:
  🔹 Identifying trainers without assigned learners
  🔹 Calculating average learner performance per course/trainer pair
    
##  Tools Used
Database: MySQL (tested in MySQL Workbench)
Language: Standard SQL Language
Environment: Structured DB environment using `USE coursehub;`


