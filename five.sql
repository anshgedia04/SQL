USE TECH_COM 

--select those cource which not including 

SELECT * FROM courses

--select those cource which not including "web"

select * from courses where CourseName NOT LIKE "%Web%"