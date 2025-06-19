USE TECH_COM;

SELECT * FROM learners
SELECT * FROM courses
SELECT  COUNT(*) FROM learners

--group by 

SELECT SelectedCourses , COUNT(*)   FROM learners GROUP BY SelectedCourses

--give source of joining with maximum experience

SELECT SourceOfJoining , MAX(YearsOfExperience) as max_exp FROM learners GROUP BY SourceOfJoining

--give source of joining with avg. experience

SELECT SourceOfJoining , AVG(YearsOfExperience) as avg_exp FROM learners GROUP BY SourceOfJoining


SELECT SourceOfJoining , COUNT(*) as avg_exp FROM learners GROUP BY SourceOfJoining HAVING avg_exp > 1 ; 


--give count of students having soj linked in

SELECT SourceOfJoining , count(*) as joined_via_linkedIN FROM learners GROUP BY SourceOfJoining HAVING SourceOfJoining = "Seminar"