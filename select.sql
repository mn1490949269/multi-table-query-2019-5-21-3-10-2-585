# 1.查询同时存在1课程和2课程的情况
select  stu.id,stu.name 
from student stu,student_course sc 
where  stu.id = sc.studentId  and sc.studentId in(
select sc.studentId 
from student_course sc 
where  sc.courseId = 1) and sc.courseId = 2;
# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select  stu.id,stu.name, sc.studentId,avg(score) 
 FROM student stu,student_course sc 
 where  stu.id = sc.studentId  
 GROUP BY sc.studentId 
 having avg(score) >60;
 
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in(
select DISTINCT sc.studentId as id from student_course sc);

# 5.查询所有有成绩的SQL
select student.id as studentId,student.name,course.id as courseId,course.name,sc.score  
from student_course sc,course,student 
where sc.studentId = student.id and sc.courseId = course.id;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select  stu.* 
from student stu,student_course sc 
where  stu.id = sc.studentId  and sc.studentId in(
select sc.studentId 
from student_course sc 
where  sc.courseId = 1) and sc.courseId = 2;

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select  stu.*,score 
from student stu,student_course sc 
where  sc.courseId = 1 and sc.score < 60 
order by  sc.score desc;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select courseId,course.name,avg(score) 
from student_course sc,course 
where sc.courseId = course.id 
group by courseId 
order by avg(score) desc,courseId asc;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select stu.name,score 
from student stu,student_course sc 
where sc.courseId in (
select course.id 
from course 
where course.name = '数学' ) and score < 60 and stu.id = sc.studentId;
