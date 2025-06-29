USE TECH_COM;

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT,
    CourseName VARCHAR(50) NOT NULL,
    CourseDuration INT NOT NULL,       -- Duration in hours or weeks (assumed)
    CourseFee INT NOT NULL,            -- Fee in INR (assumed)
    PRIMARY KEY (CourseID)
);

INSERT INTO Courses (CourseName, CourseDuration, CourseFee)
VALUES ('Full Stack Web Development', 12, 15000);

INSERT INTO Courses (CourseName, CourseDuration, CourseFee)
VALUES ('Data Structures in Java', 8, 9000);

INSERT INTO Courses (CourseName, CourseDuration, CourseFee)
VALUES ('Machine Learning Basics', 10, 12000);

INSERT INTO Courses (CourseName, CourseDuration, CourseFee)
VALUES ('Android App Development', 6, 8000);

INSERT INTO Courses (CourseName, CourseDuration, CourseFee)
VALUES ('Cybersecurity Fundamentals', 9, 10000);



CREATE TABLE Learners (
    Learner_Id INT AUTO_INCREMENT,
    LearnerFirstName VARCHAR(50) NOT NULL,
    LearnerLastName VARCHAR(50) NOT NULL,
    LearnerPhoneNo VARCHAR(15) NOT NULL,
    LearnerEmailID VARCHAR(50),
    LearnerEnrollmentDate TIMESTAMP NOT NULL,
    SelectedCourses INT NOT NULL,
    YearsOfExperience INT NOT NULL,
    LearnerCompany VARCHAR(50),
    SourceOfJoining VARCHAR(50) NOT NULL,
    Batch_Start_Date TIMESTAMP NOT NULL,
    Location VARCHAR(50) NOT NULL,
    PRIMARY KEY (Learner_Id),
    UNIQUE KEY (LearnerEmailID),
    FOREIGN KEY (SelectedCourses) REFERENCES Courses(CourseID)
);


INSERT INTO Learners (
    LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID,
    LearnerEnrollmentDate, SelectedCourses, YearsOfExperience,
    LearnerCompany, SourceOfJoining, Batch_Start_Date, Location
)
VALUES (
    'Aarav', 'Joshi', '9876543210', 'aarav.joshi@example.com',
    NOW(), 1, 2, 'TCS', 'LinkedIn', '2025-07-01 09:00:00', 'Mumbai'
);

INSERT INTO Learners (
    LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID,
    LearnerEnrollmentDate, SelectedCourses, YearsOfExperience,
    LearnerCompany, SourceOfJoining, Batch_Start_Date, Location
)
VALUES (
    'Sneha', 'Kapoor', '9988776655', 'sneha.kapoor@example.com',
    NOW(), 2, 1, 'Infosys', 'Referral', '2025-07-15 09:00:00', 'Delhi'
);

INSERT INTO Learners (
    LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID,
    LearnerEnrollmentDate, SelectedCourses, YearsOfExperience,
    LearnerCompany, SourceOfJoining, Batch_Start_Date, Location
)
VALUES (
    'Raj', 'Patel', '9123456780', 'raj.patel@example.com',
    NOW(), 3, 3, 'Wipro', 'YouTube', '2025-08-01 09:00:00', 'Ahmedabad'
);

INSERT INTO Learners (
    LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID,
    LearnerEnrollmentDate, SelectedCourses, YearsOfExperience,
    LearnerCompany, SourceOfJoining, Batch_Start_Date, Location
)
VALUES (
    'Neha', 'Verma', '9090909090', 'neha.verma@example.com',
    NOW(), 4, 0, 'Capgemini', 'Friend', '2025-08-10 09:00:00', 'Pune'
);

INSERT INTO Learners (
    LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID,
    LearnerEnrollmentDate, SelectedCourses, YearsOfExperience,
    LearnerCompany, SourceOfJoining, Batch_Start_Date, Location
)
VALUES (
    'chamira', 'Singh', '9012345678', 'chamira.singh@example.com',
    NOW(), 4, 5, 'Accenture', 'Seminar', '2025-09-01 09:00:00', 'surat'
);

SELECT * FROM courses;
SELECT * FROM learners;



SELECT * FROM emp ;


-- give me highest paid emp

SELECT * FROM emp ORDER BY salary DESC LIMIT 1 ;
--order of exicution 
-- from -> select -> orderby -> limit
--2 .
SELECT * FROM emp WHERE salary = (SELECT MAX(salary) FROM emp) ;


 -- give me highest paid emp , age >= 25 

 SELECT * FROM emp WHERE age >= 25  ORDER BY salary DESC LIMIT 1 ;


 -- display total students enrolled in tech com

 SELECT COUNT(*) as total_students from learners ; 

--count the learners with course id 3 

select count(*) from learners WHERE SelectedCourses = 3 ;


--count learners where enrollment date is in jan

SELECT COUNT(*) FROM Learners WHERE LearnerEnrollmentDate LIKE '%-01-%';

--update some thing 

UPDATE learners SET YearsOfExperience = 3 ,LearnerCompany = "TMKOC" WHERE Learner_Id = 1  ;