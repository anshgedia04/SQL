USE TECH_COM 

--select those cource which not including 

SELECT * FROM courses

--select those cource which not including "web"

select * from courses where CourseName NOT LIKE "%Web%"


SELECT * FROM learners

--give those students whose YearsOfExperience >=3 and SourceOfJoining ="youtube "

SELECT * FROM learners where YearsOfExperience >= 3 AND SourceOfJoining = "YouTube"