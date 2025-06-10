USE TECH_COM;

SELECT * FROM learners

SELECT  COUNT(*) FROM learners

--group by 

SELECT SelectedCourses , COUNT(*)   FROM learners GROUP BY SelectedCourses

--give source of joining with maximum experience

SELECT SourceOfJoining , MAX(YearsOfExperience) as max_exp FROM learners GROUP BY SourceOfJoining

--give source of joining with avg. experience

SELECT SourceOfJoining , AVG(YearsOfExperience) as max_exp FROM learners GROUP BY SourceOfJoining